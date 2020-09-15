#!/bin/bash

### Script designed to be placed in a "Run Shell Script" action in Automator
### This allows the administrator password to be called, and used in the script where sudo is required
### Beware: the inputted password is used in echo commands
### Usage: Use `sudo` without a path to ensure the `sudo` function is called rather than the actual command

# Dialog Title
dialogTitle="Munki Theme Creator"

# obtain the password from a dialog box
authPass=$(/usr/bin/osascript <<EOT
tell application "System Events"
    activate
    repeat
        display dialog "This application requires administrator privileges. Please enter your administrator account password below to continue:" ¬
            default answer "" ¬
            with title "$dialogTitle" ¬
            with hidden answer ¬
            buttons {"Quit", "Continue"} default button 2
        if button returned of the result is "Quit" then
            return 1
            exit repeat
        else if the button returned of the result is "Continue" then
            set pswd to text returned of the result
            set usr to short user name of (system info)
            try
                do shell script "echo test" user name usr password pswd with administrator privileges
                return pswd
                exit repeat
            end try
        end if
        end repeat
        end tell
EOT
)

# Abort if the Quit button was pressed
if [ "$authPass" == 1 ]; then
    /bin/echo "User aborted. Exiting..."
    exit 0
fi

# function that replaces sudo command
sudo () {
    /bin/echo $authPass | /usr/bin/sudo -S "$@"
}

###==========================
### Shell script follows here
###==========================

appname="$1"  #  Name of your App
workingdir="$2" ## Where is the script located
signcert="$3" # Name of your Developer Certificate
signcertapp="$4" # Name of your Developer Certificate
icon="$5" #name of icon file
munkiversion="$6" #name of icon file
output="$7" #output directory
bgcolor="$8" #BG Color
sbcolor="$9" #SB Color
featcolor="${10}" #FT Color
txtcolor="${11}" #TXT Color
buttcolor="${12}" #Butt Color
butttxtcolor="${13}" #Butt TXT Color
shaddow="${14}" #SHAD
themetype="${15}" #THEMETYPE
postscriptpath="${16}" #POSTSCRIPTPATH

echo $appname
echo $workingdir
echo $signcert
echo $signcertapp
echo $icon
echo $munkiversion
echo $output
echo $bgcolor
echo $sbcolor
echo $featcolor
echo $txtcolor
echo $buttcolor
echo $butttxtcolor
echo $shaddow
echo $themetype
echo $postscriptpath

## Dont Edit
sleep 0

mid='/munki/code/apps/Managed Software Center/Managed Software Center'
fullpath='/munki/code/apps/Managed Software Center/Managed Software Center/Resources/WebResources'
templatepath='/munki/code/apps/Managed Software Center/Managed Software Center/Resources/templates'
resources='/munki/code/apps/Managed Software Center/Managed Software Center/Resources/'
controllers='/munki/code/apps/Managed Software Center/Managed Software Center/Controllers'

#Unlocking File
chflags -R nouchg "$workingdir$fullpath/base.css"
echo Unlocking file at "$workingdir$fullpath/base.css"

chflags -R nouchg "$workingdir/munki/code/tools/py3_requirements.txt"
echo Unlocking file at "$workingdir/munki/code/tools/py3_requirements.txt"

rm -rf "$workingdir/munki/code/tools/py3_requirements.txt"
rm -rf "$workingdir/munki/code/tools/make_munki_mpkg.sh"
echo Removing Uneeded Files

cp "$workingdir/munki-theme/$munkiversion/$themetype/py3_requirements.txt" "$workingdir/munki/code/tools/py3_requirements.txt"
cp -r "$workingdir/munki-theme/$munkiversion/$themetype/make_munki_mpkg.sh" "$workingdir/munki/code/tools/make_munki_mpkg.sh"
echo Replacing with Modified Files

#Making writeable
chmod 755 "$workingdir$fullpath/base.css"
echo CHMOD file at "$workingdir$fullpath/base.css"

#Adding Custom CSS
cd  "$workingdir/munki-theme/$munkiversion/$themetype/"
sed -i'.bak' "s/#c8d6e5/$bgcolor/g" custom.css
sed -i'.bak' "s/#718093/$sbcolor/g" custom.css
sed -i'.bak' "s/#eeeeee/$txtcolor/g" custom.css
sed -i'.bak' "s/#7f8fa6/$buttcolor/g" custom.css
sed -i'.bak' "s/#dcdde1/$buttcolor/g" custom.css
sed -i'.bak' "s/#2f3640/$butttxtcolor/g" custom.css
sed -i'.bak' "s/color: #fff !important;/color: $butttxtcolor !important;/g" custom.css
sed -i'.bak' "s/background-color: white !important;/background-color: $featcolor !important;/g" custom.css

if [[ $shaddow == "on" ]]
then
  sed -i'.bak' "s/\/\*/ /g" custom.css
  sed -i'.bak' "s/\*/\/ /g" custom.css
fi

cd  "$workingdir$fullpath"
echo "$(echo "@import 'custom.css';" | cat - base.css)" > base.css
echo Adding Custom CSS

#Copy CSS Files
cp "$workingdir/munki-theme/$munkiversion/$themetype/custom.css" "$workingdir$fullpath"
rm "$workingdir$templatepath/detail_more_items_template.html"
cp "$workingdir/munki-theme/$munkiversion/$themetype/detail_more_items_template.html" "$workingdir$templatepath"
echo Copy CSS Files

#Modify PY Script
rm "$workingdir$mid/mschtml.swift"
cp "$workingdir/munki-theme/$munkiversion/$themetype/mschtml.swift" "$workingdir$mid/mschtml.swift"
echo Modify mschtml.swift File

#Modify icons
perl -pi -w -e 's{updatesTemplate.pdf}{updatesTemplate.png}g' "$workingdir$controllers/MainWindowController.swift"
rm -rf "$workingdir$resources/toolbarCategoriesTemplate.pdf"
rm -rf "$workingdir$resources/updatesTemplate.png"
rm -rf "$workingdir$resources/MyStuffTemplate.png"
rm -rf "$workingdir$resources/AllItemsTemplate.png"
cp "$workingdir/munki-theme/$munkiversion/$themetype/toolbarCategoriesTemplate.pdf" "$workingdir$resources"
cp "$workingdir/munki-theme/$munkiversion/$themetype/AllItemsTemplate.png" "$workingdir$resources"
cp "$workingdir/munki-theme/$munkiversion/$themetype/MyStuffTemplate.png" "$workingdir$resources"
cp "$workingdir/munki-theme/$munkiversion/$themetype/updatesTemplate.png" "$workingdir$resources"
echo Modify icons

echo Building munki
cd $workingdir/munki
./code/tools/make_munki_mpkg.sh -o $output
echo Munki Built

buildpath=`find $output -type f -name "*.pkg"`
echo $buildpath

cd ..
cd munki-rebrand/

if [ -z "$postscriptpath" ]
then
sudo ./munki_rebrand.py --appname "$appname" --pkg "$buildpath" --icon-file "$icon" --sign-package "$signcert" --sign-binaries "$signcertapp" --output-file "Signed"
else
sudo ./munki_rebrand.py --appname "$appname" --pkg "$buildpath" --postinstall "$postscriptpath" --icon-file "$icon" --sign-package "$signcert" --sign-binaries "$signcertapp" --output-file "Signed"
fi

finalpath=`find $workingdir/munki-rebrand/ -type f -name "*.pkg"`
echo $finalpath

mv $finalpath $output

open $output

exit 0

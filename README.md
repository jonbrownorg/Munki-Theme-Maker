# Munki Theme Maker
Munki Theme Maker allows you to create custom color based scheme themes for [Munki](https://github.com/munki/munki). This app picks up on the amazing work of the Munki project and the [Munki Rebrand](https://github.com/ox-it/munki-rebrand) project. The theme maker allows you to have a more modern color schemed UI made for your brand. Change the background color, featured item color and the sidebar link colors. The default new theme includes new icons on the top header row. More modern and clean rounded corner look and feel. Adding the sidebar to category pages as well as the main header slideshow or header graphic area. 

This project is the outcome of the talk given by Jon Brown at the Mac Admins Penn State Conference. [Read more about that here](https://grovetech.co/blog/penn-state-munki-customization-and-branding/). 

This app will:
- Download Munki and compile from source
- Inject the changes that you choose into the source prior to build
- Install Python into Munki
- Allow you to sign, add a custom icon thanks to [Munki Rebrand](https://github.com/ox-it/munki-rebrand)
- Save your settings for the next release

## Pre-requisites
 * Apple Mac running OS X/macOS 10.12+ 
 * Xcode 10+ (opened once, components installed)
 * Python 2 (system Python is fine)

## Usage

Munki Theme Maker runs scripts and actions into Munki as its being built and compiled. This requires us to collect the end users password and store it briefly for use while the app is running. For more information [check out the source of this feature](https://grahamrpugh.com/2017/01/07/application-to-run-shell-commands-with-admin-rights.html).

Upon launching the app you must set all variables. If any variables or customized items are missing it will fail to run. The most important items are the Source Folder (Where Munki is downloaded and compiled), the Output folder where you will get 2 copies of Munki the unbranded and the branded and themed versions. The App Name (the new name of the Managed Software Update App that you wish it to be). The signing certificate authority (for use when signing the final package - Developer ID Installer) and the App certificate authority (for used to sign the binaries of Munki - Developer ID Application). 

Pick the colors of the theme in the next tab (Colors) and then finally set the icon that you will use for the final touch. Once all set hit "Generate" and let the Munki Theme Builder do its thing. 

It will download and clone into your source folder Munki, Munki Rebrand and the base Munki Theme with all injectable files. Injection happens, and then Munki builds. 

The App has backwards compatibility for Munki version 4.1.4 as of writing this through to version 5.0.0. We plan to relase new baseline themes and modifications for each dot iteration of the Munki core release. 

## Troubleshooting/Notes

1. If you get an error saying that the app could not run, its because you entered the wrong password when prompted. 
2. If the output folder is empty after Munki Theme Maker runs it means that the script has somehow failed or files were modified prior to hitting generate. Delete the source files and try again. 
3. If you need to start over please quit the app and start again. Delete the source and target folders and remake them. 

## To-do
* Better handling of user passwords and passing that through to the various scripts natively. 
* Adding a progress indicator so the user knows where in the process the builder is
* Adding functionality to pipe the output of the scripts to a window for easy visualization
* Adding functionality to pipe the output to a console log file for ease of troubleshooting

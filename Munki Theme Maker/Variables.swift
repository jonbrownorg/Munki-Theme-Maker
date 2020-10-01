//
//  Variables.swift
//  Munki Theme Maker
//
//  Created by Jon Brown on 7/1/20.
//  Copyright © 2020 Grove Technologies. All rights reserved.
//

import Cocoa
import Foundation

class Variables: NSObject {
    
    @IBOutlet weak var themeType: NSPopUpButton!
    @IBOutlet weak var munkiVersion: NSPopUpButton!
    @IBOutlet weak var appCert: NSTextField!
    @IBOutlet weak var iconFile: NSTextField!
    @IBOutlet weak var certName: NSTextField!
    @IBOutlet weak var appName: NSTextField!
    @IBOutlet var myViewController : ViewController!
    @IBOutlet weak var workingDirectory: NSTextField!
    @IBOutlet weak var outputDirectory: NSTextField!
    @IBOutlet weak var iconImage: NSImageView!
    @IBOutlet weak var BG: NSTextField!
    @IBOutlet weak var bgColor: NSColorWell!
    @IBOutlet weak var BGFeat: NSTextField!
    @IBOutlet weak var BGSide: NSTextField!
    @IBOutlet weak var colorView: NSView!
    @IBOutlet weak var iconView: NSView!
    
    @IBOutlet var theResTxt: NSTextView!
    @IBOutlet weak var spinner: NSProgressIndicator!
    @IBOutlet weak var firstView: NSView!
    @IBOutlet weak var loadingView: NSView!
    @IBOutlet weak var mainView: NSView!
    @IBOutlet weak var hexBG: NSTextField!
    @IBOutlet weak var hexSide: NSTextField!
    @IBOutlet weak var sideBar: NSTextField!
    @IBOutlet weak var featuredArea: NSTextField!
    @IBOutlet weak var hexFeat: NSTextField!
    
    @IBOutlet weak var bgcolor: NSTextField!
    @IBOutlet weak var cat: NSTextField!
    @IBOutlet weak var feat: NSTextField!
    
    
    @IBOutlet weak var appText: NSTextField!
    @IBOutlet weak var featText: NSTextField!
    @IBOutlet weak var catTxt: NSTextField!
    @IBOutlet weak var hexTXT: NSTextField!
    @IBOutlet weak var featButt: NSTextField!
    
    @IBOutlet weak var buttonField: NSTextField!
    @IBOutlet weak var buttView: NSTextField!
    @IBOutlet weak var hexBUTT: NSTextField!
    
    @IBOutlet weak var hexbTitle: NSTextField!
    @IBOutlet weak var buttonTitle: NSTextField!
    @IBOutlet weak var shadValue: NSTextField!
    @IBOutlet weak var postscriptPath: NSTextField!
    @IBOutlet weak var clearPostinstall: NSButton!
    
    
    @IBAction func clearPost(_ sender: Any) {
        
        postscriptPath.stringValue = ""
        UserDefaults.standard.set(postscriptPath.stringValue, forKey: "PostscriptPath") //STR
    }
    
    @IBAction func changeShad(_ sender: NSButton) {
    
        switch sender.state {
        case .on:
            print("on")
            shadValue.stringValue = "on"
        case .off:
            print("off")
            shadValue.stringValue = "off"
        case .mixed:
            print("mixed")
        default: break
        }
        
        
    }
    
    @IBAction func changeButtTitle(_ sender: NSColorWell) {
        
        let colortxtbutt = sender.color
        buttonTitle.textColor = colortxtbutt
        hexbTitle.stringValue = colortxtbutt.hexString
        
        UserDefaults.standard.set(colortxtbutt.hexString, forKey: "butttextColor") //STR
        UserDefaults.standard.set(colortxtbutt, forKey: "butttextColorSW")
        
    }
    
    @IBAction func changeButtColor(_ sender: NSColorWell) {
    
        let colorbutt = sender.color
        buttonField.drawsBackground = true
        buttonField.backgroundColor = colorbutt
        
        hexBUTT.stringValue = colorbutt.hexString
        
        UserDefaults.standard.set(colorbutt.hexString, forKey: "buttColor") //STR
        UserDefaults.standard.set(colorbutt, forKey: "buttColorSW")
        
    }
    
    
    @IBAction func changeTXTColor(_ sender: NSColorWell) {
        
        let colortxt = sender.color
        appText.textColor = colortxt
        catTxt.textColor = colortxt
        hexTXT.stringValue = colortxt.hexString
        
        UserDefaults.standard.set(colortxt.hexString, forKey: "textColor") //STR
        UserDefaults.standard.set(colortxt, forKey: "textColorSW")
    }
    
    @IBAction func changeBGColor(_ sender : NSColorWell)
    {
       let colorbg = sender.color
       // do something with the color
        BG.drawsBackground = true
        BG.backgroundColor = colorbg
        hexBG.stringValue = colorbg.hexString
        sideBar.backgroundColor = colorbg
        buttView.backgroundColor = colorbg
        BGFeat.backgroundColor = colorbg
        
        UserDefaults.standard.set(colorbg.hexString, forKey: "bgColor") //STR
        UserDefaults.standard.set(colorbg, forKey: "bgColorSW")
        
        
        
    }

    @IBAction func changeSBColor(_ sender : NSColorWell)
    {
       let colorside = sender.color
       // do something with the color
        BGSide.textColor = colorside
        hexSide.stringValue = colorside.hexString
        featText.textColor = colorside
        UserDefaults.standard.set(colorside.hexString, forKey: "sideColor") //STR
        UserDefaults.standard.set(colorside, forKey: "sideColorSW")
        
        
        
        
    }
    
    @IBAction func changeFeatColor(_ sender : NSColorWell)
    {
       let colorfeat = sender.color
       // do something with the color
        featuredArea.drawsBackground = true
        featuredArea.backgroundColor = colorfeat
        featButt.drawsBackground = true
        featButt.backgroundColor = colorfeat
        hexFeat.stringValue = colorfeat.hexString
        UserDefaults.standard.set(colorfeat.hexString, forKey: "featColor") //STR
        UserDefaults.standard.set(colorfeat, forKey: "featColorSW")
        
    }
    
   @IBAction func getWorking(_ sender: AnyObject!) {
       let dialog = NSOpenPanel();

       dialog.title                   = "Choose Working Directory | Munki Theme Builder";
       dialog.showsResizeIndicator    = true;
       dialog.showsHiddenFiles        = false;
       dialog.canChooseFiles = false;
       dialog.canChooseDirectories = true;

       if (dialog.runModal() ==  NSApplication.ModalResponse.OK) {
           let result = dialog.url

           if (result != nil) {
               let _: String = result!.path
               workingDirectory.stringValue = result!.path
               UserDefaults.standard.set(result!.path, forKey: "WorkingDirectory") //STR
            
           }
       } else {
           // User clicked on "Cancel"
           return
       }
   }
    
    @IBAction func getIcon(_ sender: AnyObject!) {
        let dialog = NSOpenPanel();

        dialog.title                   = "Choose Icon | Munki Theme Builder";
        dialog.showsResizeIndicator    = true;
        dialog.showsHiddenFiles        = false;
        dialog.canChooseFiles = true;
        dialog.canChooseDirectories = false;

        if (dialog.runModal() ==  NSApplication.ModalResponse.OK) {
            let result = dialog.url
            UserDefaults.standard.set(result!.path, forKey: "iconPath") //STR
            
            if (result != nil) {
                let _: String = result!.path
                iconFile.stringValue = result!.path
                iconImage.image = NSImage(byReferencingFile: result!.path)
            } else {
                iconFile.stringValue = UserDefaults.standard.string(forKey: "iconPath")!
                iconImage.image = NSImage(byReferencingFile: UserDefaults.standard.string(forKey: "iconPath")!)
            }
            
        } else {
            // User clicked on "Cancel"
            return
        }
    }
    
    
    @IBAction func getPostscript(_ sender: Any) {
        let dialog = NSOpenPanel();

               dialog.title                   = "Choose Postscript File | Munki Theme Builder";
               dialog.showsResizeIndicator    = true;
               dialog.showsHiddenFiles        = true;
               dialog.canChooseFiles = true;
               dialog.canChooseDirectories = false;

               if (dialog.runModal() ==  NSApplication.ModalResponse.OK) {
                   let result = dialog.url

                   if (result != nil) {
                       let _: String = result!.path
                       postscriptPath.stringValue = result!.path
                       UserDefaults.standard.set(result!.path, forKey: "PostscriptPath") //STR
                   }
               } else {
                   // User clicked on "Cancel"
                   return
               }
    }
    
    @IBAction func getOutput(_ sender: AnyObject!) {
        let dialog = NSOpenPanel();

        dialog.title                   = "Choose Output Directory | Munki Theme Builder";
        dialog.showsResizeIndicator    = true;
        dialog.showsHiddenFiles        = false;
        dialog.canChooseFiles = false;
        dialog.canChooseDirectories = true;

        if (dialog.runModal() ==  NSApplication.ModalResponse.OK) {
            let result = dialog.url

            if (result != nil) {
                let _: String = result!.path
                outputDirectory.stringValue = result!.path
                UserDefaults.standard.set(result!.path, forKey: "OutputPath") //STR
            }
        } else {
            // User clicked on "Cancel"
            return
        }
    }
    
    @IBAction func submit(_ sender: NSButton) {
        
        firstView.removeFromSuperview()
        colorView.removeFromSuperview()
        iconView.removeFromSuperview()
        
        mainView.addSubview(loadingView)
        spinner.startAnimation(self)
        
        let fileManager = FileManager.default
        
        do {
            try fileManager.removeItem(atPath: workingDirectory.stringValue + "/munki")
            try fileManager.removeItem(atPath: workingDirectory.stringValue + "/munki-theme")
            try fileManager.removeItem(atPath: workingDirectory.stringValue + "/munki-rebrand")
        }
        catch let error as NSError {
            print("Ooops! Something went wrong: \(error)")
        }
        
        UserDefaults.standard.set(appName.stringValue, forKey: "appName") //STR
        UserDefaults.standard.set(appCert.stringValue, forKey: "appCert") //STR
        UserDefaults.standard.set(certName.stringValue, forKey: "signCert") //STR
        
           let source = "https://github.com/munki/munki"
           let target = workingDirectory.stringValue + "/munki"
        
           let arg40 = "v4.0.0"
           let arg401 = "v4.0.1"
           let arg410 = "v4.1.0"
           let arg411 = "v4.1.1"
           let arg412 = "v4.1.2"
           let arg413 = "v4.1.3"
           let arg414 = "v4.1.4"
           let arg5 = "v5.0.0"
           let arg501 = "v5.0.1"
           let arg51 = "v5.1.0"
            
           let argrb = "v3.2.1"
           let argrb3 = "v3.3"
           let argmt = "v1.7.9"
           
           let sourcerebrand = "https://github.com/ox-it/munki-rebrand"
           let targetrebrand = workingDirectory.stringValue + "/munki-rebrand"
        
           let sourcetheme = "https://github.com/jonbrown21/munki-theme"
           let targettheme = workingDirectory.stringValue + "/munki-theme"

         if munkiVersion.titleOfSelectedItem == "5.0.0" {
            try! Process().clone(repo: source, path: target, arg: arg5)
         } else if munkiVersion.titleOfSelectedItem == "5.1.0" {
            try! Process().clone(repo: source, path: target, arg: arg51)
         } else if munkiVersion.titleOfSelectedItem == "5.0.1" {
            try! Process().clone(repo: source, path: target, arg: arg501)
         } else if munkiVersion.titleOfSelectedItem == "4.0.0" {
            try! Process().clone(repo: source, path: target, arg: arg40)
         } else if munkiVersion.titleOfSelectedItem == "4.0.1" {
            try! Process().clone(repo: source, path: target, arg: arg401)
         } else if munkiVersion.titleOfSelectedItem == "4.1.0" {
            try! Process().clone(repo: source, path: target, arg: arg410)
         } else if munkiVersion.titleOfSelectedItem == "4.1.1" {
            try! Process().clone(repo: source, path: target, arg: arg411)
         } else if munkiVersion.titleOfSelectedItem == "4.1.2" {
            try! Process().clone(repo: source, path: target, arg: arg412)
         } else if munkiVersion.titleOfSelectedItem == "4.1.3" {
            try! Process().clone(repo: source, path: target, arg: arg413)
         } else {
           try! Process().clone(repo: source, path: target, arg: arg414)
         }
        
        if munkiVersion.titleOfSelectedItem == "5.1.0" {
            try! Process().clone(repo: sourcerebrand, path: targetrebrand, arg: argrb3)
        } else {
            try! Process().clone(repo: sourcerebrand, path: targetrebrand, arg: argrb)
        }
           
           try! Process().clone(repo: sourcetheme, path: targettheme, arg: argmt)
        
        let task = Process()
        task.launchPath = "/bin/bash"
        
        //let path = "/bin/bash"
        let shellpath = Bundle.main.path(forResource: "rb.sh",ofType:nil)
        let shellpathstr = String(shellpath!)
        let themeTpe =  String(themeType.titleOfSelectedItem!)
        
        task.arguments = [shellpathstr, appName.stringValue, workingDirectory.stringValue, certName.stringValue, appCert.stringValue, iconFile.stringValue, munkiVersion.titleOfSelectedItem!, outputDirectory.stringValue, bgcolor.stringValue, cat.stringValue, feat.stringValue, hexTXT.stringValue, hexBUTT.stringValue, hexbTitle.stringValue, shadValue.stringValue, themeTpe, postscriptPath.stringValue]
        
        sender.isEnabled = false
       
        let pipe = Pipe()
        task.standardOutput = pipe
        let outHandle = pipe.fileHandleForReading

        outHandle.readabilityHandler = { pipe in
            if let line = String(data: pipe.availableData, encoding: String.Encoding.utf8) {
                // Update your view with the new text here
               
                DispatchQueue.main.async {
                    self.theResTxt.textStorage?.append(NSAttributedString(string: line))
                    self.theResTxt.scrollToEndOfDocument(nil)
                    
                    let file = "Munki-Theme-Maker-Log.txt" //this is the file. we will write to and read from it

                    let text = self.theResTxt.string  //the text we'll write
                    
                    // we'll write the file in the user's documents directory
                    if let dir = FileManager.default.urls(for: .downloadsDirectory, in: .userDomainMask).first {

                        let fileURL = dir.appendingPathComponent(file)

                        //writing
                        do {
                            try text.write(to: fileURL, atomically: false, encoding: .utf8)
                        }
                        catch {/* error handling here */}
                    }
                    
                    
               }
                
                print("New ouput: \(line)")
            } else {
                print("Error decoding data: \(pipe.availableData)")
            }
        }
        
        task.launch()
        
        //let task = Process.launchedProcess(launchPath: path, arguments: arguments)
        
        task.waitUntilExit()

        spinner.stopAnimation(self)
        loadingView.removeFromSuperview()
        mainView.addSubview(firstView)
        
        sender.isEnabled = true
    }

}

extension Process {

    private static let gitExecURL = URL(fileURLWithPath: "/usr/bin/git")

    public func clone(repo: String, path: String, arg: String) throws {
        executableURL = Process.gitExecURL
        arguments = ["clone", repo, path, "-b", arg]
        try run()
    }

}

extension NSColor {

    var hexString: String {
        guard let rgbColor = usingColorSpaceName(NSColorSpaceName.calibratedRGB) else {
            return "FFFFFF"
        }
        let red = Int(round(rgbColor.redComponent * 0xFF))
        let green = Int(round(rgbColor.greenComponent * 0xFF))
        let blue = Int(round(rgbColor.blueComponent * 0xFF))
        let hexString = NSString(format: "#%02X%02X%02X", red, green, blue)
        return hexString as String
    }

}

extension UserDefaults {
    
    func set(_ color: NSColor, forKey: String) {
        if let data = try? NSKeyedArchiver.archivedData(withRootObject: color, requiringSecureCoding: false) {
            self.set(data, forKey: forKey)
        }
    }
    
    func color(forKey: String) -> NSColor? {
        guard
            let storedData = self.data(forKey: forKey),
            let unarchivedData = try? NSKeyedUnarchiver.unarchivedObject(ofClass: NSColor.self, from: storedData),
            let color = unarchivedData as NSColor?
        else {
            return nil
        }
        
        return color
    }
    
}

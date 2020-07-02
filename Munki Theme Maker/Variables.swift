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
    
    
    @IBAction func changeBGColor(_ sender : NSColorWell)
    {
       let colorbg = sender.color
       // do something with the color
        BG.drawsBackground = true
        BG.backgroundColor = colorbg
        BG.textColor = NSColor.white
        BG.stringValue = colorbg.hexString
        
        UserDefaults.standard.set(colorbg.hexString, forKey: "bgColor") //STR
    }

    @IBAction func changeSBColor(_ sender : NSColorWell)
    {
       let colorside = sender.color
       // do something with the color
        BGSide.drawsBackground = true
        BGSide.backgroundColor = colorside
        BGSide.textColor = NSColor.white
        BGSide.stringValue = colorside.hexString
        UserDefaults.standard.set(colorside.hexString, forKey: "sideColor") //STR
    }
    
    @IBAction func changeFeatColor(_ sender : NSColorWell)
    {
       let colorfeat = sender.color
       // do something with the color
        BGFeat.drawsBackground = true
        BGFeat.backgroundColor = colorfeat
        BGFeat.textColor = NSColor.white
        BGFeat.stringValue = colorfeat.hexString
        UserDefaults.standard.set(colorfeat.hexString, forKey: "featColor") //STR
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
        
           let source414 = "https://github.com/munki/munki"
           let arg414 = "v4.1.4"
           let target414 = workingDirectory.stringValue + "/munki"
        
           let source5 = "https://github.com/munki/munki"
           let arg5 = "v5.0.0"
           let target5 = workingDirectory.stringValue + "/munki"
            
           let argrb = "v3.2.1"
           let argmt = "v1.0"
           
           let sourcerebrand = "https://github.com/ox-it/munki-rebrand"
           let targetrebrand = workingDirectory.stringValue + "/munki-rebrand"
        
           let sourcetheme = "https://github.com/jonbrown21/munki-theme"
           let targettheme = workingDirectory.stringValue + "/munki-theme"

         if munkiVersion.titleOfSelectedItem == "5.0.0" {
            try! Process().clone(repo: source5, path: target5, arg: arg5)
         } else {
           try! Process().clone(repo: source414, path: target414, arg: arg414)
         }
        
           try! Process().clone(repo: sourcerebrand, path: targetrebrand, arg: argrb)
           try! Process().clone(repo: sourcetheme, path: targettheme, arg: argmt)
        
        let path = "/bin/bash"
        let shellpath = Bundle.main.path(forResource: "rb.sh",ofType:nil)
        let shellpathstr = String(shellpath!)
        let arguments = [shellpathstr, appName.stringValue, workingDirectory.stringValue, certName.stringValue, appCert.stringValue, iconFile.stringValue, munkiVersion.titleOfSelectedItem!, outputDirectory.stringValue, BG.stringValue, BGSide.stringValue, BGFeat.stringValue]
        sender.isEnabled = false
        let task = Process.launchedProcess(launchPath: path, arguments: arguments)
        task.waitUntilExit()
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

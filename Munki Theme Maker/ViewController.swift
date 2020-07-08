//
//  ViewController.swift
//  Munki Theme Maker
//
//  Created by Jon Brown on 7/1/20.
//  Copyright © 2020 Grove Technologies. All rights reserved.
//

import Cocoa
import Foundation

class ViewController: NSViewController {

    var currntSeg : Int = 1
    @IBOutlet var variables: Variables?
    @IBOutlet weak var containerView: NSView!
    @IBOutlet var variableView: NSView!
    @IBOutlet var colorView: NSView!
    @IBOutlet var iconView: NSView!
    @IBOutlet weak var workingDirectory: NSTextField!
    @IBOutlet weak var outputPath: NSTextField!
    @IBOutlet weak var appName: NSTextField!
    @IBOutlet weak var signCert: NSTextField!
    @IBOutlet weak var appCert: NSTextField!
    @IBOutlet weak var iconFile: NSTextField!
    @IBOutlet weak var iconImage: NSImageView!
    @IBOutlet weak var bgColor: NSTextField!
    @IBOutlet weak var sideColor: NSTextField!
    @IBOutlet weak var featColor: NSTextField!
    @IBOutlet var loadingView: NSView!
    @IBOutlet weak var bgColorWell: NSColorWell!
    @IBOutlet weak var sideColorWell: NSColorWell!
    @IBOutlet weak var featColorWell: NSColorWell!
    @IBOutlet weak var hexBG: NSTextField!
    @IBOutlet weak var hexSide: NSTextField!
    @IBOutlet weak var sideBar: NSTextField!
    @IBOutlet weak var hexFeat: NSTextField!
    @IBOutlet weak var featuredArea: NSTextField!
    
    @IBOutlet var acSwitch: NSSegmentedControl!
    @IBAction func SwitchButton(_ sender: AnyObject) {
        switch acSwitch.selectedSegment {
        case 0:
            containerView.addSubview(variableView)
            colorView.removeFromSuperview()
            iconView.removeFromSuperview()
            break
        case 1:
            containerView.addSubview(colorView)
            variableView.removeFromSuperview()
            iconView.removeFromSuperview()
            break
        case 2:
            variableView.removeFromSuperview()
            colorView.removeFromSuperview()
            containerView.addSubview(iconView)
            break
        default:
            variableView.removeFromSuperview()
            colorView.removeFromSuperview()
            iconView.removeFromSuperview()
            break
        }
        currntSeg = acSwitch.selectedSegment
        print("Selected Seg: \(acSwitch.selectedSegment)")
    }
    
    
    
    override func viewDidLoad() {
        
        containerView.addSubview(variableView)
        colorView.removeFromSuperview()
        
        if UserDefaults.standard.string(forKey: "WorkingDirectory") != nil {
            workingDirectory.stringValue = UserDefaults.standard.string(forKey: "WorkingDirectory")!
            
        } else {
            workingDirectory.stringValue = "Set Working Path Value"
        }
        if UserDefaults.standard.string(forKey: "OutputPath") != nil {
            outputPath.stringValue = UserDefaults.standard.string(forKey: "OutputPath")!
        } else {
            outputPath.stringValue = "Set Output Path Value"
        }
        
        if UserDefaults.standard.string(forKey: "appName") != nil {
            appName.stringValue = UserDefaults.standard.string(forKey: "appName")!
        } else {
            appName.stringValue = "Set App Name"
        }
        
        if UserDefaults.standard.string(forKey: "appCert") != nil {
            appCert.stringValue = UserDefaults.standard.string(forKey: "appCert")!
        } else {
            appCert.stringValue = "Set Application Cert"
        }
        
        if UserDefaults.standard.string(forKey: "signCert") != nil {
            signCert.stringValue = UserDefaults.standard.string(forKey: "signCert")!
        } else {
            signCert.stringValue = "Set Sign Cert"
        }
        
        if UserDefaults.standard.string(forKey: "iconPath") != nil {
            iconFile.stringValue = UserDefaults.standard.string(forKey: "iconPath")!
            iconImage.image = NSImage(byReferencingFile: UserDefaults.standard.string(forKey: "iconPath")!)
        } else {
            iconFile.stringValue = ""
        }
        
        
        if ((UserDefaults.standard.string(forKey: "bgColor") != nil) || (UserDefaults.standard.string(forKey: "bgColorSW") != nil)) {
            
            let hexbgcolor = UserDefaults.standard.string(forKey: "bgColor")!
            hexBG.stringValue = hexbgcolor

            let swiftBGColor = UserDefaults.standard.color(forKey: "bgColorSW")
            bgColor.backgroundColor = swiftBGColor
            bgColor.drawsBackground = true
            bgColorWell.color = swiftBGColor!
            sideBar.backgroundColor = swiftBGColor
            
            featColor.drawsBackground = true
            featColor.backgroundColor = swiftBGColor

        } else {
            bgColor.stringValue = ""
        }
        
        if ((UserDefaults.standard.string(forKey: "sideColor") != nil) || (UserDefaults.standard.string(forKey: "sideColorSW") != nil)) {
            
            let hexbgcolor = UserDefaults.standard.string(forKey: "sideColor")!
            hexSide.stringValue = hexbgcolor
            
            if (hexbgcolor == "#FFFFFF") {
                sideColor.textColor = NSColor.black
            } else {
                sideColor.textColor = NSColor.white
            }
            
            let swiftSDColor = UserDefaults.standard.color(forKey: "sideColorSW")
            sideColor.textColor = swiftSDColor
            sideColorWell.color = swiftSDColor!

        } else {
            sideColor.stringValue = ""
        }
        
        if ((UserDefaults.standard.string(forKey: "featColorSW") != nil) || (UserDefaults.standard.string(forKey: "featColor") != nil)) {
               
            let swiftFTColor = UserDefaults.standard.color(forKey: "featColorSW")
            featColorWell.color = swiftFTColor!
            let hexbgcolor = UserDefaults.standard.string(forKey: "featColor")!
            hexFeat.stringValue = hexbgcolor
            featuredArea.backgroundColor = swiftFTColor
            
                        
        } else {
            featColor.stringValue = ""
        }
        
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    
    func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
        NSApplication.shared.terminate(self)
        return true
    }
    
    

}


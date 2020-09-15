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
    @IBOutlet weak var imageBG: NSView!
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
    @IBOutlet weak var catImageView: NSImageView!
    @IBOutlet weak var featuredImageView: NSImageView!
    @IBOutlet weak var bgImageView: NSImageView!
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
    @IBOutlet weak var textColor: NSColorWell!
    @IBOutlet weak var appText: NSTextField!
    @IBOutlet weak var hexTXT: NSTextField!
    @IBOutlet weak var featuredText: NSTextField!
    @IBOutlet weak var catText: NSTextField!
    @IBOutlet weak var buttView: NSTextField!
    @IBOutlet weak var buttImageView: NSImageView!
    @IBOutlet weak var featButt: NSTextField!
    @IBOutlet weak var buttonField: NSTextField!
    @IBOutlet weak var buttColor: NSColorWell!
    @IBOutlet weak var hexBUTT: NSTextField!
    @IBOutlet weak var buttonTitle: NSTextField!
    @IBOutlet weak var buttonTitleColor: NSColorWell!
    @IBOutlet weak var hexbTitle: NSTextField!
    @IBOutlet weak var shadValue: NSTextField!
    @IBOutlet weak var ScrollView: NSScrollView!
    @IBOutlet weak var postInstall: NSTextField!
    @IBOutlet weak var scrollingView: NSView!
    
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
        
        ScrollView.documentView?.scroll(NSPoint.zero)
        
        hexTXT.isHidden = true
        hexFeat.isHidden = true
        hexSide.isHidden =  true
        hexBG.isHidden = true
        hexBUTT.isHidden = true
        hexbTitle.isHidden = true
        shadValue.isHidden = true
        
        shadValue.stringValue = "off"
        
        containerView.addSubview(variableView)
        colorView.removeFromSuperview()
        
        catImageView.wantsLayer = true
        catImageView.layer?.cornerRadius = 8.0
        catImageView.layer?.masksToBounds = true
        
        buttImageView.wantsLayer = true
        buttImageView.layer?.cornerRadius = 8.0
        buttImageView.layer?.masksToBounds = true
        
        buttView.wantsLayer = true
        buttView.layer?.cornerRadius = 8.0
        
        sideBar.wantsLayer = true
        sideBar.layer?.cornerRadius = 8.0
        
        featuredImageView.wantsLayer = true
        featuredImageView.layer?.cornerRadius = 8.0
        featuredImageView.layer?.masksToBounds = true
        featuredArea.wantsLayer = true
        featuredArea.layer?.cornerRadius = 8.0
        featButt.wantsLayer = true
        featButt.layer?.cornerRadius = 8.0
        buttonField.wantsLayer = true
        buttonField.layer?.cornerRadius = 15.0
        featColor.wantsLayer = true
        featColor.layer?.cornerRadius = 8.0
        
        bgImageView.wantsLayer = true
        bgImageView.layer?.cornerRadius = 8.0
        bgImageView.layer?.masksToBounds = true
        bgColor.wantsLayer = true
        bgColor.layer?.cornerRadius = 8.0
        
        imageBG.wantsLayer = true
        imageBG.layer?.borderWidth = 3.0
        imageBG.layer?.borderColor =  #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        imageBG.layer?.cornerRadius = 20.0
        imageBG.layer?.masksToBounds = true
       
        if UserDefaults.standard.string(forKey: "PostscriptPath") != nil {
            postInstall.stringValue = UserDefaults.standard.string(forKey: "PostscriptPath")!
            
        } else {
            postInstall.stringValue = ""
        }
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
            let swiftBGColor = UserDefaults.standard.color(forKey: "bgColorSW")
            
            hexBG.stringValue = hexbgcolor
            bgColor.backgroundColor = swiftBGColor
            bgColor.drawsBackground = true
            bgColorWell.color = swiftBGColor!
            sideBar.backgroundColor = swiftBGColor
            buttView.backgroundColor = swiftBGColor
            featColor.drawsBackground = true
            featColor.backgroundColor = swiftBGColor

        } else {
            
            bgColor.backgroundColor = NSColor.white
            bgColorWell.color = NSColor.white
            hexBG.stringValue = ""
            sideBar.backgroundColor = NSColor.white
            buttView.backgroundColor = NSColor.white
            featColor.backgroundColor = NSColor.white
            featColor.drawsBackground = true
            bgColor.drawsBackground = true
        }
        
        if ((UserDefaults.standard.string(forKey: "sideColor") != nil) || (UserDefaults.standard.string(forKey: "sideColorSW") != nil)) {
            
            let hexbgcolor = UserDefaults.standard.string(forKey: "sideColor")!
            let swiftSDColor = UserDefaults.standard.color(forKey: "sideColorSW")
            
            hexSide.stringValue = hexbgcolor
            sideColor.textColor = swiftSDColor
            sideColorWell.color = swiftSDColor!
            featuredText.textColor = swiftSDColor

        } else {
            sideColor.stringValue = ""
            sideColorWell.color = NSColor.white
            hexSide.stringValue = ""
            featuredText.textColor = NSColor.white
        }
        
        if ((UserDefaults.standard.string(forKey: "featColorSW") != nil) || (UserDefaults.standard.string(forKey: "featColor") != nil)) {
               
            let swiftFTColor = UserDefaults.standard.color(forKey: "featColorSW")
            let hexbgcolor = UserDefaults.standard.string(forKey: "featColor")!
            
            featColorWell.color = swiftFTColor!
            hexFeat.stringValue = hexbgcolor
            featuredArea.backgroundColor = swiftFTColor
            featButt.backgroundColor = swiftFTColor
            
                        
        } else {
            featuredArea.stringValue = ""
            featButt.stringValue = ""
            featColorWell.color = NSColor.white
            hexFeat.stringValue = ""
        }
        
        
        if ((UserDefaults.standard.string(forKey: "textColorSW") != nil) || (UserDefaults.standard.string(forKey: "textColor") != nil)) {
               
            let swiftTXTColor = UserDefaults.standard.color(forKey: "textColorSW")
            let hextxtcolor = UserDefaults.standard.string(forKey: "textColor")!
            
            textColor.color = swiftTXTColor!
            hexTXT.stringValue = hextxtcolor
            appName.textColor = swiftTXTColor
            catText.textColor = swiftTXTColor
            
                        
        } else {
            textColor.color = NSColor.white
            hexTXT.stringValue = ""
            appName.textColor = NSColor.white
            catText.textColor = NSColor.white
        }
        
        if ((UserDefaults.standard.string(forKey: "butttextColor") != nil) || (UserDefaults.standard.string(forKey: "butttextColorSW") != nil)) {
               
            let swiftBUTTTXTColor = UserDefaults.standard.color(forKey: "butttextColorSW")
            let hexbuttTXTcolor = UserDefaults.standard.string(forKey: "butttextColor")!
            
            
            hexbTitle.stringValue = hexbuttTXTcolor
            buttonTitle.textColor = swiftBUTTTXTColor
            buttonTitleColor.color = swiftBUTTTXTColor!
                        
        } else {
            hexbTitle.stringValue = "#FFFFFF"
            buttonTitle.textColor = NSColor.white
            buttonTitleColor.color = NSColor.white
        }
        
        
        if ((UserDefaults.standard.string(forKey: "buttColorSW") != nil) || (UserDefaults.standard.string(forKey: "buttColor") != nil)) {
               
            let swiftBUTTColor = UserDefaults.standard.color(forKey: "buttColorSW")
            let hexbuttcolor = UserDefaults.standard.string(forKey: "buttColor")!
            
            buttonField.drawsBackground = true
            buttonField.backgroundColor = swiftBUTTColor
            hexBUTT.stringValue = hexbuttcolor
            buttColor.color = swiftBUTTColor!
                        
        } else {
            buttonField.drawsBackground = true
            buttonField.backgroundColor = NSColor.gray
            hexBUTT.stringValue = "#FFFFFF"
            buttColor.color = NSColor.gray
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


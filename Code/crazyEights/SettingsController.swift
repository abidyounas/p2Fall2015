//
//  SettingsController.swift
//  crazyEights
//
//  Created by Kamal Gill on 2015-10-21.
//  Copyright (c) 2015 Kamal Gill. All rights reserved.
//

import UIKit

class SettingsController : UIViewController, UIGestureRecognizerDelegate, UIPickerViewDataSource, UIPickerViewDelegate {
    let setSingleton = SettingsSingleton.sharedInstance
    @IBOutlet weak var difficultyText: UILabel!
    @IBOutlet weak var numOfPlayersText: UILabel!
    @IBOutlet weak var fontText: UILabel!
    @IBOutlet weak var themeText: UILabel!
    @IBOutlet weak var otherText: UILabel!
    
    var savedDifficultyText = ""
    var savedNumOfPlayers = ""
    var savedFontText = ""
    var savedThemeText = ""
    var savedOtherText = ""
    
    @IBOutlet weak var player01Name: UITextField!
    
    @IBOutlet weak var player02Name: UITextField!
    @IBOutlet weak var player03Name: UITextField!
    @IBOutlet weak var player04Name: UITextField!
    @IBOutlet weak var swipeBack: UIView!


    
    @IBOutlet weak var difficultySelector: UITextField!
    @IBOutlet weak var numOfPlayersSelector: UITextField!
    @IBOutlet weak var fontSelector: UITextField!
    @IBOutlet weak var themeSelector: UITextField!
    
   
    @IBOutlet weak var pickerView1: UIPickerView! = UIPickerView()
  
   
    var difficultyModes = ["Normal", "Easy", "Hard", "Expert"]
    var numOfPlayers = ["2", "3", "4"]
    var fonts = ["Helvetica", "Arial", "Courier", "San Francisco" ]
    var themeColors = ["Original","Orange", "Aqua", "Holiday", "Code Red"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        //set default values
        difficultySelector.text = setSingleton.difficulty
        fontSelector.text = setSingleton.font
        numOfPlayersSelector.text = setSingleton.numOfPlayers
        themeSelector.text = setSingleton.theme
        
        player01Name.text = setSingleton.player01Name
        player02Name.text = setSingleton.player02Name
        player03Name.text = setSingleton.player03Name
        player04Name.text = setSingleton.player04Name
        
        //hide picker on load
        pickerView1.hidden = true
        
    

    }


    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if (pickerView1.tag == 1) {
            return difficultyModes.count
        } else if (pickerView1.tag == 2) {
            return numOfPlayers.count
        } else if (pickerView1.tag == 3) {
            return fonts.count
        } else if (pickerView1.tag == 4) {
            return themeColors.count
        }
        return 1
    }
  
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        if (pickerView1.tag == 1) {
            return difficultyModes[row]
        } else if (pickerView1.tag == 2) {
            return numOfPlayers[row]
        } else if (pickerView1.tag == 3) {
            return fonts[row]
        } else if (pickerView1.tag == 4) {
            return themeColors[row]
        }
        
        return ""
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if (pickerView1.tag == 1) {
            pickerView1.reloadAllComponents()
            difficultySelector.text = difficultyModes[row]
            savedDifficultyText = difficultyModes[row]
            setSingleton.difficulty = difficultyModes[row]
        } else if (pickerView1.tag == 2) {
            pickerView1.reloadAllComponents()
            numOfPlayersSelector.text = numOfPlayers[row]
            savedNumOfPlayers = numOfPlayers[row]
            setSingleton.numOfPlayers = numOfPlayers[row]
        } else if (pickerView1.tag == 3) {
            pickerView1.reloadAllComponents()
            fontSelector.text = fonts[row]
            //self.savedFontText.text = self.fontSelector.text
            
            switch fontSelector.text {
            case "Arial":
                setSingleton.font = "Arial"
                otherText.font = UIFont(name: "Arial", size: 17)
                difficultyText.font = UIFont(name: "Arial", size: 17)
                numOfPlayersText.font = UIFont(name: "Arial", size: 17)
                fontText.font = UIFont(name: "Arial", size: 17)
                themeText.font = UIFont(name: "Arial", size: 17)
            case "Courier":
                setSingleton.font = "Courier"
                otherText.font = UIFont(name: "Courier", size: 17)
                difficultyText.font = UIFont(name: "Courier", size: 17)
                numOfPlayersText.font = UIFont(name: "Courier", size: 17)
                fontText.font = UIFont(name: "Courier", size: 17)
                themeText.font = UIFont(name: "Courier", size: 17)
            case "San Francisco":
                setSingleton.font = "San Francisco"
                otherText.font = UIFont(name: "San Francisco", size: 17)
                difficultyText.font = UIFont(name: "San Francisco", size: 17)
                numOfPlayersText.font = UIFont(name: "San Francisco", size: 17)
                fontText.font = UIFont(name: "San Francisco", size: 17)
                themeText.font = UIFont(name: "San Francisco", size: 17)
            default:
                //setSingleton.font = "Helvetica"
                UIFont(name: "Helvetica", size: 20)
                
            }
        } else if (pickerView1.tag == 4) {
            pickerView1.reloadAllComponents()
            themeSelector.text = themeColors[row]
            
            switch themeSelector.text {
            case "Orange":
                setSingleton.theme = "Orange"
            case "Aqua":
                setSingleton.theme = "Aqua"
            case "Holiday":
                setSingleton.theme = "Holiday"
            case "Code Red":
                setSingleton.theme = "Code Red"
            default:
                setSingleton.theme = "Original"
            }
        }
    
    }
    
    @IBAction func difficultyEditing(sender: AnyObject) {
        difficultySelector.resignFirstResponder()
        
        self.pickerView1.dataSource = self;
        self.pickerView1.delegate = self;
        pickerView1.tag = 1
        
        pickerView1.hidden = false
        
    }
    
    @IBAction func difficultyEditingDone(sender: AnyObject) {

        pickerView1.hidden = true
    }
 
    @IBAction func numOfPlayersEditingStarted(sender: AnyObject) {
        numOfPlayersSelector.resignFirstResponder()
        
        self.pickerView1.dataSource = self;
        self.pickerView1.delegate = self;
        pickerView1.tag = 2
        difficultySelector.resignFirstResponder()
        
        pickerView1.hidden = false
    }
    
    @IBAction func numOfPlayersEditingEnd(sender: AnyObject) {
        pickerView1.hidden = true
    }
    
    @IBAction func fontEditingStarted(sender: AnyObject) {
        fontSelector.resignFirstResponder()
        
        self.pickerView1.dataSource = self
        self.pickerView1.delegate = self
        pickerView1.tag = 3
        fontSelector.resignFirstResponder()
        
        pickerView1.hidden = false
    }
    
    @IBAction func fontEditingEnd(sender: AnyObject) {
        pickerView1.hidden = true
    }
    
    @IBAction func themeColorsEditingStarted(sender: AnyObject) {
        themeSelector.resignFirstResponder()
        
        self.pickerView1.dataSource = self;
        self.pickerView1.delegate = self;
        pickerView1.tag = 4
        themeSelector.resignFirstResponder()
        
        pickerView1.hidden = false
        
    }

    @IBAction func themeColorsEditingEnd(sender: AnyObject) {
        pickerView1.hidden = true
 
    }
    
    @IBAction func player01NameEditingStarted(sender: AnyObject) {
        
    }
    @IBAction func player01NameEditingEnd(sender: AnyObject) {
        setSingleton.player01Name = self.player01Name.text
    }
    
    @IBAction func player02NameEditingStarted(sender: AnyObject) {
    }
   
    @IBAction func player02NameEditingEnd(sender: AnyObject) {
    }
  
    @IBAction func player03NameEditingStarted(sender: AnyObject) {
        setSingleton.player02Name = self.player02Name.text
    }
    @IBAction func player03NameEditingEnd(sender: AnyObject) {
        setSingleton.player03Name = self.player03Name.text
    }
    
    @IBAction func player04EditingStarted(sender: AnyObject) {
    }
    @IBAction func player04EditingEnd(sender: AnyObject) {
        setSingleton.player04Name = self.player04Name.text
    }
    
    func swipedRight(sender:UISwipeGestureRecognizer) {
        if (sender.direction == .Right) {
            println("Swipe Right")
            self.dismissViewControllerAnimated(true, completion: nil)
            
        }
    }
   


}

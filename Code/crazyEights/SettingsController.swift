//
//  SettingsController.swift
//  crazyEights
//
//  Created by Kamal Gill on 2015-10-21.
//  Copyright (c) 2015 Kamal Gill. All rights reserved.
//

import UIKit

class SettingsController : UIViewController, UIGestureRecognizerDelegate, UIPickerViewDataSource, UIPickerViewDelegate {

    
    @IBOutlet weak var difficultyText: UILabel!
    @IBOutlet weak var numOfPlayersText: UILabel!
    @IBOutlet weak var fontText: UILabel!
    @IBOutlet weak var themeText: UILabel!
    @IBOutlet weak var otherText: UILabel!
    
    @IBOutlet weak var swipeBack: UIView!

    
    @IBOutlet weak var difficultySelector: UITextField!
    @IBOutlet weak var numOfPlayersSelector: UITextField!
    @IBOutlet weak var fontSelector: UITextField!
    @IBOutlet weak var themeSelector: UITextField!
    
   
    @IBOutlet weak var pickerView1: UIPickerView! = UIPickerView()
  
   
    var difficultyModes = ["Normal", "Easy", "Hard", "Expert"]
    var numOfPlayers = ["2", "3", "4"]
    var fonts = ["Helvetica", "Arial", "Courier", "San Francisco" ]
    var themeColors = ["Original","Blue", "Green", "Red", "Yellow"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       /*
        let swipeRight: UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: Selector("swipedRight:"))
        swipeRight.direction = UISwipeGestureRecognizerDirection.Right
        self.swipeBack.addGestureRecognizer(swipeRight)*/
        
        //set default values
        //difficultySelector.text = difficultyModes[pickerView1.selectedRowInComponent(0)]
        fontSelector.text = fonts[0]
        numOfPlayersSelector.text = numOfPlayers[0]
        themeSelector.text = themeColors[0]
        
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
        } else if (pickerView1.tag == 2) {
            pickerView1.reloadAllComponents()
            numOfPlayersSelector.text = numOfPlayers[row]
        } else if (pickerView1.tag == 3) {
            pickerView1.reloadAllComponents()
            fontSelector.text = fonts[row]
            
            switch fontSelector.text {
            case "Arial":
                otherText.font = UIFont(name: "Arial", size: 17)
                difficultyText.font = UIFont(name: "Arial", size: 17)
                numOfPlayersText.font = UIFont(name: "Arial", size: 17)
                fontText.font = UIFont(name: "Arial", size: 17)
                themeText.font = UIFont(name: "Arial", size: 17)
            case "Courier":
                otherText.font = UIFont(name: "Courier", size: 17)
                difficultyText.font = UIFont(name: "Courier", size: 17)
                numOfPlayersText.font = UIFont(name: "Courier", size: 17)
                fontText.font = UIFont(name: "Courier", size: 17)
                themeText.font = UIFont(name: "Courier", size: 17)
            case "San Francisco":
                otherText.font = UIFont(name: "San Francisco", size: 17)
                difficultyText.font = UIFont(name: "San Francisco", size: 17)
                numOfPlayersText.font = UIFont(name: "San Francisco", size: 17)
                fontText.font = UIFont(name: "San Francisco", size: 17)
                themeText.font = UIFont(name: "San Francisco", size: 17)
            default:
                UIFont(name: "Helvetica", size: 20)
                
            }
        } else if (pickerView1.tag == 4) {
            pickerView1.reloadAllComponents()
            themeSelector.text = themeColors[row]
            
            switch themeSelector.text {
            case "Blue":
                self.view.backgroundColor = UIColor.blueColor()
                //navigationController?.navigationBar.barTintColor = UIColor.blueColor()
            case "Green":
                self.view.backgroundColor = UIColor.greenColor()
            case "Red":
                self.view.backgroundColor = UIColor.redColor()
            case "Yellow":
                self.view.backgroundColor = UIColor.yellowColor()
            default:
                self.view.backgroundColor = UIColor.whiteColor()
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
    
    
  
    func swipedRight(sender:UISwipeGestureRecognizer) {
        if (sender.direction == .Right) {
            println("Swipe Right")
            self.dismissViewControllerAnimated(true, completion: nil)
            
        }
    }
   


}

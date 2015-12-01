//
//  ViewController.swift
//  crazyEights
//
//  Created by Kamal Gill on 2015-09-29.
//  Copyright (c) 2015 Kamal Gill. All rights reserved.
//

import UIKit

class ViewController: UIViewController{
    let setSingleton = SettingsSingleton.sharedInstance
    var counter = 0

    @IBOutlet weak var playNowButton: UIButton!
    
    @IBOutlet weak var settingsBtn: UIImageView!
    @IBOutlet weak var leaderboardButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
                
        if (setSingleton.theme == "Orange") {
            UINavigationBar.appearance().barTintColor = UIColor.orangeColor()
            playNowButton.backgroundColor = UIColor.orangeColor()
            leaderboardButton.backgroundColor = UIColor.orangeColor()
        } else if (setSingleton.theme == "Aqua") {
            UINavigationBar.appearance().barTintColor = UIColor(red:0.00, green:0.80, blue:0.80, alpha:1.0)
            playNowButton.backgroundColor = UIColor(red:0.00, green:0.80, blue:0.80, alpha:1.0)
            leaderboardButton.backgroundColor = UIColor(red:0.00, green:0.80, blue:0.80, alpha:1.0)
        } else if (setSingleton.theme == "Holiday") {
            UINavigationBar.appearance().barTintColor = UIColor(red:0.20, green:0.60, blue:0.40, alpha:1.0)
            playNowButton.backgroundColor = UIColor(red:0.20, green:0.60, blue:0.40, alpha:1.0)
            leaderboardButton.backgroundColor = UIColor(red:0.20, green:0.60, blue:0.40, alpha:1.0)
        } else if (setSingleton.theme == "Code Red") {
            UINavigationBar.appearance().barTintColor = UIColor(red:0.80, green:0.00, blue:0.00, alpha:1.0)
            playNowButton.backgroundColor = UIColor(red:0.80, green:0.00, blue:0.00, alpha:1.0)
            leaderboardButton.backgroundColor = UIColor(red:0.80, green:0.00, blue:0.00, alpha:1.0)
        } else { //default
            UINavigationBar.appearance().barTintColor = UIColor(red:0.17, green:0.24, blue:0.31, alpha:1.0)
            playNowButton.backgroundColor = UIColor(red:0.17, green:0.24, blue:0.31, alpha:1.0)
            leaderboardButton.backgroundColor = UIColor(red:0.17, green:0.24, blue:0.31, alpha:1.0)
        }
    
        
        //create tap gesture recongizer
        let tapGesture = UITapGestureRecognizer(target: self, action: "imageTapped:")
        
        //add it to the image view
        settingsBtn.addGestureRecognizer(tapGesture)
        //make sure imageView can be interacted with by user
        settingsBtn.userInteractionEnabled = true
        
    }
    
    
    
    func imageTapped(gesture: UIGestureRecognizer) {
        if let settingsBtn = gesture.view as? UIImageView {
            println("tapped!")
            let vc : AnyObject! = self.storyboard?.instantiateViewControllerWithIdentifier("settingsCon")
            self.showViewController(vc as! UIViewController, sender: vc)
        }
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


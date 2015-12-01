//
//  GamePlayController.swift
//  crazyEights
//
//  Created by Kamal Gill on 2015-09-29.
//  Copyright (c) 2015 Kamal Gill. All rights reserved.
//

import UIKit

class GamePlayController: UIViewController, UIGestureRecognizerDelegate, UITextFieldDelegate{
  
    let lbSingleton = LeaderboardSingleton.sharedInstance
    let setSingleton = SettingsSingleton.sharedInstance
 
    
    @IBOutlet weak var loseButton: UIButton!
    @IBOutlet weak var winButton: UIButton!
    @IBOutlet weak var cards: UIImageView!
    @IBOutlet weak var settingsBtn: UIImageView!
    
    @IBOutlet weak var player2Head: UIImageView!
    @IBOutlet weak var player3Head: UIImageView!
    @IBOutlet weak var player4Head: UIImageView!
    
    @IBOutlet weak var background: UIImageView!
    
    @IBOutlet weak var player01Name: UILabel!
    @IBOutlet weak var player2Name: UILabel!
    @IBOutlet weak var player3Name: UILabel!
    @IBOutlet weak var player4Name: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Bluetooth Connect Alert
        let alert = UIAlertView()
        alert.title = "Bluetooth Paring Request"
        alert.message = "Ben's iphone  would like to pair with your iPhone."
        alert.addButtonWithTitle("Cancel")
        alert.addButtonWithTitle("Pair")
        alert.show()

        // Connecting Alert
        /*let alert = UIAlertView()
        alert.title = "Starting Game"
        alert.message = "Connecting to players nearby..."
        alert.addButtonWithTitle("OK")
        alert.show()
        */
        
        self.player01Name.text = setSingleton.player01Name
        self.player2Name.text = setSingleton.player02Name
        
        self.player3Head.hidden = true
        self.player4Head.hidden = true
        self.player3Name.hidden = true
        self.player4Name.hidden = true
        
        if (setSingleton.numOfPlayers == "3") {
            self.player3Head.hidden = false
            self.player3Name.hidden = false
            self.player3Name.text = setSingleton.player03Name
        } else if (setSingleton.numOfPlayers == "4") {
            self.player3Head.hidden = false
            self.player3Name.hidden = false
            self.player4Head.hidden = false
            self.player4Name.hidden = false
            self.player3Name.text = setSingleton.player03Name
            self.player4Name.text = setSingleton.player04Name
        }
        
        if (setSingleton.theme == "Orange") {
            self.background.image = UIImage(named: "background_orange.png")
        } else if (setSingleton.theme == "Aqua") {
            self.background.image = UIImage(named: "background_aqua.png")
        } else if (setSingleton.theme == "Holiday") {
            self.background.image = UIImage(named: "background_holiday.png")
        } else if (setSingleton.theme == "Code Red") {
            self.background.image = UIImage(named: "background_codeRed.png")
        }
    
        let swipeRight: UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: Selector("swipedRight:"))
        swipeRight.direction = UISwipeGestureRecognizerDirection.Right
        self.cards.addGestureRecognizer(swipeRight)
    
        
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
    
    func swipedRight(sender:UISwipeGestureRecognizer) {
    if (sender.direction == .Right) {
        println("Swipe Right")
        self.dismissViewControllerAnimated(true, completion: nil)
     
        }
    }
    
    @IBAction func loseBtn(sender: AnyObject) {
        self.loseButtonAction(self.loseButton)
        lbSingleton.addLoseCount()
        println(lbSingleton.getLoseCount())
    }
    
    @IBAction func winBtn(sender: AnyObject) {
        self.winButtonAction(self.winButton)
        lbSingleton.addWinCount()
        println(lbSingleton.getWinCount())
    }
    
  
    // User receives a simulated lose message
    @IBAction func loseButtonAction(sender: AnyObject) {
        var alertView:UIAlertView = UIAlertView()
        alertView.title = "Game Finished"
        alertView.message = "You lost!"
        alertView.delegate = self
        alertView.addButtonWithTitle("OK")
        alertView.show()
    }

    // Use receives a simulated win message
    @IBAction func winButtonAction(sender: AnyObject) {
        var alertView:UIAlertView = UIAlertView()
        alertView.title = "Game Finished"
        alertView.message = "You won!"
        alertView.delegate = self
        alertView.addButtonWithTitle("OK")
        alertView.show()
    }
  
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}


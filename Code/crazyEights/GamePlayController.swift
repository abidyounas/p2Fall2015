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
    let profilePic = PlayerController()
    
    @IBOutlet weak var loseButton: UIButton!
    @IBOutlet weak var winButton: UIButton!
    @IBOutlet weak var cards: UIImageView!
    @IBOutlet weak var settingsBtn: UIImageView!
    
    @IBOutlet weak var player2Head: UIImageView!
    
    @IBOutlet weak var player2Name: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Bluetooth Connect Alert
        let alert = UIAlertView()
        alert.title = "Bluetooth Paring Request"
        alert.message = "Ben's iPhone would like to pair with your iPhone."
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
        
        generateRandomPlayerPicture()
    
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
    
    func generateRandomPlayerPicture() {
        let randomIndex = Int(arc4random_uniform(UInt32(profilePic.randomNames.count)))
        
        if (randomIndex == 0) {
            self.player2Head.image = UIImage(named: "jesse_profile_head_02.png")
            self.player2Name.text = profilePic.randomNames[0]
        } else if (randomIndex == 1) {
            self.player2Head.image = UIImage(named: "maria_profile_head_02.png")
            self.player2Name.text = profilePic.randomNames[1]
        } else if (randomIndex == 2) {
            self.player2Head.image = UIImage(named: "jane_profile_head_02.png")
            self.player2Name.text = profilePic.randomNames[2]
        } else if (randomIndex == 3) {
            self.player2Head.image = UIImage(named: "nelson_profile_head_02.png")
            self.player2Name.text = profilePic.randomNames[3]
        }
        

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


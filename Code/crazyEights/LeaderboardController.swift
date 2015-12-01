//
//  LeaderboardController.swift
//  crazyEights
//
//  Created by Kamal Gill on 2015-10-22.
//  Copyright (c) 2015 Kamal Gill. All rights reserved.
//


import UIKit

class LeaderboardController : UIViewController, UITextFieldDelegate, UIGestureRecognizerDelegate {
    @IBOutlet weak var losses: UILabel!
    
    @IBOutlet weak var score: UILabel!
    let lbSingleton = LeaderboardSingleton.sharedInstance
    let setSingleton = SettingsSingleton.sharedInstance
    
    var randomNames = ["Jesse", "Maria", "Jane", "Nelson"]
    
    @IBOutlet weak var player2WinScore: UILabel!
    @IBOutlet weak var player2LoseScore: UILabel!
    @IBOutlet weak var player02Pic: UIImageView!
    
    @IBOutlet weak var player3WinScore: UILabel!
    @IBOutlet weak var player3LoseScore: UILabel!
    
    @IBOutlet weak var player4WinScore: UILabel!
    @IBOutlet weak var player4LoseScore: UILabel!
   
    @IBOutlet weak var player01Name: UILabel!
    @IBOutlet weak var player02Name: UILabel!
    @IBOutlet weak var player03Name: UILabel!
    @IBOutlet weak var player04Name: UILabel!
    
    @IBOutlet weak var leaderboardBg: UIImageView!
    @IBOutlet weak var player02Bg: UIImageView!
    @IBOutlet weak var player03Bg: UIImageView!
    @IBOutlet weak var player04Bg: UIImageView!
    
    @IBOutlet weak var swipeBack: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if (lbSingleton.getWinCount() > lbSingleton.getLoseCount()) {
            lbSingleton.decrementPlayer02()
            lbSingleton.decrementPlayer03()
            lbSingleton.decrementPlayer04()
        } else if((lbSingleton.getWinCount() == 0) && (lbSingleton.getLoseCount() == 0)) {
            //do nothing
        } else if (lbSingleton.getWinCount() <= lbSingleton.getLoseCount()) {
            let random = arc4random_uniform(3) + 1
            if (random == 1) {
                lbSingleton.incrementPlayer02()//player02 wins
                lbSingleton.decrementPlayer03()
                lbSingleton.decrementPlayer04()
            } else if (random == 2) {
                lbSingleton.incrementPlayer03()//player03 wins
                lbSingleton.decrementPlayer02()
                lbSingleton.decrementPlayer04()
            } else if (random == 3) {
                lbSingleton.incrementPlayer04()//player04 wins
                lbSingleton.decrementPlayer02()
                lbSingleton.decrementPlayer03()
            }
        }
        
        self.player01Name.text = setSingleton.player01Name
        self.player02Name.text = setSingleton.player02Name
        self.player03Name.text = setSingleton.player03Name
        self.player04Name.text = setSingleton.player04Name
        
        
        if (setSingleton.theme == "Orange") {
            self.leaderboardBg.backgroundColor = UIColor.orangeColor()
            self.player02Bg.backgroundColor = UIColor(red:0.60, green:0.20, blue:0.00, alpha:1.0)
            self.player03Bg.backgroundColor = UIColor(red:1.00, green:0.20, blue:0.00, alpha:1.0)
            self.player04Bg.backgroundColor = UIColor(red:1.00, green:0.60, blue:0.40, alpha:1.0)
        } else if (setSingleton.theme == "Aqua") {
            self.leaderboardBg.backgroundColor = UIColor(red:0.00, green:0.80, blue:0.80, alpha:1.0)
            self.player02Bg.backgroundColor = UIColor(red:0.40, green:0.60, blue:0.80, alpha:1.0)
            self.player03Bg.backgroundColor = UIColor(red:0.20, green:0.40, blue:0.60, alpha:1.0)
            self.player04Bg.backgroundColor = UIColor(red:0.20, green:0.60, blue:0.80, alpha:1.0)
        } else if (setSingleton.theme == "Holiday") {
            self.leaderboardBg.backgroundColor = UIColor(red:0.20, green:0.60, blue:0.40, alpha:1.0)
            self.player02Bg.backgroundColor = UIColor(red:1.00, green:1.00, blue:1.00, alpha:1.0)
            self.player03Bg.backgroundColor = UIColor(red:0.80, green:0.20, blue:0.20, alpha:1.0)
            self.player04Bg.backgroundColor = UIColor(red:0.00, green:0.40, blue:0.00, alpha:1.0)
        } else if (setSingleton.theme == "Code Red") {
            self.leaderboardBg.backgroundColor = UIColor(red:0.80, green:0.00, blue:0.00, alpha:1.0)
            self.player02Bg.backgroundColor = UIColor.redColor()
            self.player03Bg.backgroundColor = UIColor.redColor()
            self.player04Bg.backgroundColor = UIColor.redColor()
        } else { //default
            self.leaderboardBg.backgroundColor = UIColor(red:0.17, green:0.24, blue:0.31, alpha:1.0)
            self.player02Bg.backgroundColor = UIColor(red:0.17, green:0.24, blue:0.31, alpha:1.0)
            self.player03Bg.backgroundColor = UIColor(red:0.17, green:0.24, blue:0.31, alpha:1.0)
            self.player04Bg.backgroundColor = UIColor(red:0.17, green:0.24, blue:0.31, alpha:1.0)
        }
        
        self.displayScore()
    
    
    }
    
    func displayScore() {
        score.text = String(lbSingleton.getWinCount())
        losses.text = String(lbSingleton.getLoseCount())
        
        self.player2WinScore.text = String(lbSingleton.getPlayer02WinCount())
        self.player2LoseScore.text = String(lbSingleton.getPlayer02LoseCount())
        
        self.player2WinScore.text = String(lbSingleton.getPlayer03WinCount())
        self.player3LoseScore.text = String(lbSingleton.getPlayer03LoseCount())
        
        self.player4WinScore.text = String(lbSingleton.getPlayer04WinCount())
        self.player4LoseScore.text = String(lbSingleton.getPlayer04LoseCount())
        
    }
    
    func swipedRight(sender:UISwipeGestureRecognizer) {
        if (sender.direction == .Right) {
            println("Swipe Right")
            self.dismissViewControllerAnimated(true, completion: nil)
            
        }
    }

    
        
    
   

}
//
//  LeaderboardController.swift
//  crazyEights
//
//  Created by Kamal Gill on 2015-10-22.
//  Copyright (c) 2015 Kamal Gill. All rights reserved.
//


import UIKit

class LeaderboardController : UIViewController, UITextFieldDelegate, UIGestureRecognizerDelegate {
    //@IBOutlet weak var score: UILabel!
    @IBOutlet weak var score: UILabel!
    @IBOutlet weak var losses: UILabel!
    let lbSingleton = LeaderboardSingleton.sharedInstance
    
   // var randomNames = ["John", "Matt", "Jesse", "Catherine", "Maria", "Jane", "Nelson"]
    
    //@IBOutlet weak var player02Name: UILabel!
 
    @IBOutlet weak var swipeBack: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.displayScore()
        
        let swipedBack: UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: Selector("swipedRight:"))
        swipedBack.direction = UISwipeGestureRecognizerDirection.Right
        self.swipeBack.addGestureRecognizer(swipedBack)
        
        let swipedForward: UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: Selector("swipedForward:"))
        swipedForward.direction = UISwipeGestureRecognizerDirection.Left
        self.swipeBack.addGestureRecognizer(swipedForward)
        
        
    
    }
    
    func displayScore() {
        score.text = String(lbSingleton.getWinCount())
        losses.text = String(lbSingleton.getLoseCount())
        
    }
    
    func swipedRight(sender:UISwipeGestureRecognizer) {
        if (sender.direction == .Right) {
            println("Swipe Right")
            self.dismissViewControllerAnimated(true, completion: nil)
            
        }
    }

    
    func swipedForward(sender:UISwipeGestureRecognizer) {
        if (sender.direction == .Left) {
            println("Swiped left")
            
            let vc : AnyObject! = self.storyboard?.instantiateViewControllerWithIdentifier("player02")
            self.showViewController(vc as! UIViewController, sender: vc)
            //self.navigationController?.popViewControllerAnimated(true)
              //self.dismissViewControllerAnimated(true, completion: nil)
            //self.dismissViewControllerAnimated(true, completion: nil)
            
        }
    }
    
    
   

}
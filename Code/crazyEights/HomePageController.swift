//
//  HomePageController.swift
//  crazyEights
//
//  Created by Kamal Gill on 2015-10-21.
//  Copyright (c) 2015 Kamal Gill. All rights reserved.
//

import UIKit


class HomePageController : UIViewController {
    
    @IBOutlet weak var settingsBtn: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
    
}

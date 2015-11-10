//
//  ViewController.swift
//  crazyEights
//
//  Created by Kamal Gill on 2015-09-29.
//  Copyright (c) 2015 Kamal Gill. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var counter = 0

    @IBOutlet weak var settingsBtn: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        
    
        // Do any additional setup after loading the view, typically from a nib.
        
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


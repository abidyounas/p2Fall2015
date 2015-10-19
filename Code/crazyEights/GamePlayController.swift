//
//  GamePlayController.swift
//  crazyEights
//
//  Created by Kamal Gill on 2015-09-29.
//  Copyright (c) 2015 Kamal Gill. All rights reserved.
//

import UIKit

class GamePlayController: UIViewController, UIGestureRecognizerDelegate {
    @IBOutlet weak var imageView : UIImageView!
    let tapRec = UITapGestureRecognizer()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*
        // Bluetooth Connect Alert
        let alert = UIAlertView()
        alert.title = "Starting Game"
        alert.message = "Connecting to players nearby..."
        alert.addButtonWithTitle("OK")
        alert.show()*/
        
        
        var UITapRecongnizer = UITapGestureRecognizer(target: self, action: "tappedImage:")
        UITapRecongnizer.delegate = self
        self.imageView.addGestureRecognizer(UITapRecongnizer)
        self.imageView.userInteractionEnabled = true
       
    
       
        
    }
    
    func tappedImage(sender: AnyObject) {
        println("image tapped!")
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}


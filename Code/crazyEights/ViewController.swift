//
//  ViewController.swift
//  crazyEights
//
//  Created by Kamal Gill on 2015-09-29.
//  Copyright (c) 2015 Kamal Gill. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Bluetooth Connect Alert
        let alert = UIAlertView()
        alert.title = "Bluetooth Paring Request"
        alert.message = "Ben's iPhone would like to pair with your iPhone."
        alert.addButtonWithTitle("Cancel")
        alert.addButtonWithTitle("Pair")
        alert.show()
    
        // Do any additional setup after loading the view, typically from a nib.
       
        
    }
    
  

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


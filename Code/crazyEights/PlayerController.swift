//
//  PlayerController.swift
//  crazyEights
//
//  Created by Kamal Gill on 2015-11-02.
//  Copyright (c) 2015 Kamal Gill. All rights reserved.
//

import UIKit

class PlayerController : UIViewController {
    
    var randomNames = ["Jesse", "Maria", "Jane", "Nelson"]
    
    @IBOutlet weak var player02Name: UILabel!
    
    @IBOutlet weak var changePlayerProfile: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        
        let randomIndex = Int(arc4random_uniform(UInt32(randomNames.count)))
        player02Name.text = randomNames[randomIndex]
        
        if (player02Name.text == "Jesse") {
            self.changePlayerProfile.image = UIImage(named: "jesse_profile_02.png")
        } else if (player02Name.text == "Maria") {
            self.changePlayerProfile.image = UIImage(named: "maria_profile_02.png")
        } else if (player02Name.text == "Jane") {
            self.changePlayerProfile.image = UIImage(named: "jane_profile_02.png")
        } else if (player02Name.text == "Nelson") {
            self.changePlayerProfile.image = UIImage(named: "nelson_profile_02.png")
        }
        
        /*switch player02Name.text {
        case "Jesse":
            self.changePlayerProfile.image = UIImage(named: "jesse_profile_02.png")
            
        case "Maria":
            self.changePlayerProfile.image = UIImage(named: "maria_profile_02.png")
            
        case "Jane":
            self.changePlayerProfile.image = UIImage(named: "jane_profile_02.png")
            
        case "Nelson":
            self.changePlayerProfile.image = UIImage(named: "john_profile_02.png")
        default:
            self.changePlayerProfile.image = UIImage(named: "jesse_profile_02.png")
            
        }*/
        
    
    }

    
    

}

//
//  BLEManager.swift
//  crazyEights
//
//  Created by Kamal Gill on 2015-10-22.
//  Copyright (c) 2015 Kamal Gill. All rights reserved.
//

import Foundation
import UIKit
import CoreBluetooth

class BLEManager {
    var centralManager : CBCentralManager!
    var bleHandler : BLEHandler // delegate
    init() {
        self.bleHandler = BLEHandler()
        self.centralManager = CBCentralManager(delegate: self.bleHandler, queue: nil)
    }
    
    func centralManager(central: CBCentralManager!, didDiscoverPeripheral peripheral: CBPeripheral!,
        advertisementData: [NSObject : AnyObject]!, RSSI: NSNumber!) {
            println("\(peripheral.name) : \(RSSI) dBm")
    }
    
}


//
//  BLEHandler.swift
//  crazyEights
//
//  Created by Kamal Gill on 2015-10-22.
//  Copyright (c) 2015 Kamal Gill. All rights reserved.
//

import Foundation
import CoreBluetooth

class BLEHandler : NSObject, CBCentralManagerDelegate {
    override init() {
        super.init()
        
    }
    
    func centralManagerDidUpdateState(central: CBCentralManager!) {
        switch(central.state)
        {
        case .Unsupported:
            println("BLE is unsupported")
        case .Unauthorized:
            println("BLE is unauthorized")
        case .Unknown:
            println("BLE is unknown")
        case .Resetting:
            println("BLE is resetting")
        case .PoweredOff:
            println("BLE is powered off")
        case .PoweredOn:
            println("BLE is powered on")
            println("Start scanning")
            central.scanForPeripheralsWithServices(nil, options: nil)
        default:
            println("BLE is default")
        }
    }
}



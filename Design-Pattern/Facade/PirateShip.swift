//
//  PirateShip.swift
//  Facade
//
//  Created by Pszertlek on 2018/2/21.
//  Copyright © 2018年 Pszertlek. All rights reserved.
//

import Foundation

class PirateShip {
    struct ShipLocation {
        let NorthSouth: Int
        let EastWest: Int
    }
    
    var currentPosition: ShipLocation
    var movementQueue = DispatchQueue(label: "ShipQ")
    
    init() {
        currentPosition = ShipLocation(NorthSouth: 5, EastWest: 5)
    }
    
    func moveToLocation(location: ShipLocation, callback: ((ShipLocation) -> Void)?) {
        movementQueue.async {
            self.currentPosition = location
            callback?(self.currentPosition)
        }
    }
}

//
//  PirateCrew.swift
//  Facade
//
//  Created by Pszertlek on 2018/2/21.
//  Copyright © 2018年 Pszertlek. All rights reserved.
//

import Foundation

class PirateCrew {
    let workQueue = DispatchQueue(label: "crewWorkQ")
    enum Actions {
        case attackShip
        case digForGold
        case diveForJewels
    }
    
    func performAction(action: Actions, callback: @escaping (Int) -> Void) {
        workQueue.async {
            var prizeValue = 0
            switch action {
            case .attackShip:
                prizeValue = 10000
            case .digForGold:
                prizeValue = 5000
            case .diveForJewels:
                prizeValue = 1000
            }
            callback(prizeValue)
        }
    }
}

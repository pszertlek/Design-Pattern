//
//  Facade.swift
//  Facade
//
//  Created by Pszertlek on 2018/2/21.
//  Copyright © 2018年 Pszertlek. All rights reserved.
//

import Foundation

enum TreasureTypes {
    case ship
    case buried
    case sunken
}

class PirateFacade {
    private let map = TreasureMap()
    private let ship = PirateShip()
    private let crew = PirateCrew()
    
    func getTreasure(type: TreasureTypes) -> Int? {
        var prizeAmount: Int?
        var treasureMapType: TreasureMap.Treasures
        var crewWorkType: PirateCrew.Actions
        
        switch type {
        case .ship:
            treasureMapType = TreasureMap.Treasures.gallenon
            crewWorkType = PirateCrew.Actions.attackShip
        case .buried:
            treasureMapType = TreasureMap.Treasures.buriedGold
            crewWorkType = PirateCrew.Actions.digForGold
        case .sunken:
            treasureMapType = TreasureMap.Treasures.sunkenJewels
            crewWorkType = PirateCrew.Actions.diveForJewels
        }
        let treasureLocation = map.findTreasure(type: treasureMapType)
        let sequence: [Character] = ["A","B","C","D","E","F","G"]
        let eastWestPos = sequence.index(of: treasureLocation.gridLetter)
        let shipTarget = PirateShip.ShipLocation(NorthSouth: Int(treasureLocation.gridNumber), EastWest: eastWestPos!)
        let semaphore = DispatchSemaphore(value: 0)
        ship.moveToLocation(location: shipTarget) { (location) in
            self.crew.performAction(action: crewWorkType, callback: { (prize) in
                prizeAmount = prize
                semaphore.signal()
            })
        }

        _ = semaphore.wait(timeout: DispatchTime.distantFuture)
        return prizeAmount
    }
}

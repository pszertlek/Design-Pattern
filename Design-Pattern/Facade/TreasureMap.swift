//
//  TreasureMap.swift
//  Facade
//
//  Created by Pszertlek on 2018/2/21.
//  Copyright © 2018年 Pszertlek. All rights reserved.
//

import Foundation

class TreasureMap {
    enum Treasures {
        case gallenon; case buriedGold; case sunkenJewels
    }
    struct MapLocation {
        let gridLetter: Character
        let gridNumber: UInt
    }
    
    func findTreasure(type: Treasures) -> MapLocation {
        switch type {
        case .gallenon:
            return MapLocation(gridLetter: "D", gridNumber: 6)
        case .buriedGold:
            return MapLocation(gridLetter: "C", gridNumber: 2)
        case .sunkenJewels:
            return MapLocation(gridLetter: "F", gridNumber: 12)
        }
    }
}

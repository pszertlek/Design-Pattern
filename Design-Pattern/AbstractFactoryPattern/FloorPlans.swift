//
//  FloorPlans.swift
//  AbstractFactoryPattern
//
//  Created by Pszertlek on 2018/3/6.
//  Copyright © 2018年 Pszertlek. All rights reserved.
//

import Foundation

protocol FloorPlan {
    var seats: Int { get }
    var enginePosition: EngineOption { get }
}

enum EngineOption: String {
    case front = "Front"
    case mid = "Mid"
}

class ShortFloorplan: FloorPlan {
    var seats: Int = 2
    var enginePosition: EngineOption = .mid
}

class StandardFloorplan: FloorPlan {
    var seats: Int = 4
    var enginePosition: EngineOption = .front
}

class LongFloorplan: FloorPlan {
    var seats: Int = 8
    var enginePosition: EngineOption = .front
}

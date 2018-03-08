//
//  Abstract.swift
//  AbstractFactoryPattern
//
//  Created by Pszertlek on 2018/3/6.
//  Copyright © 2018年 Pszertlek. All rights reserved.
//

import Foundation

class CarFactory {
    func createFloorplan() -> FloorPlan {
        fatalError("Not implemented")
    }
    func createSuspension() -> Suspension {
        fatalError("Not implemented")
    }
    
    func createDriveTrain() -> DriveTrain {
        fatalError("Not implemented")
    }
    
    final class func getFactory(car: Cars) -> CarFactory {
        var factory: CarFactory!
        switch car {
        case .compact:
            factory = CompactCarFactory()
        case .sports:
            factory = SportsCarFactory()
        case .SUV:
            factory = SUVCarFactory()
        }
        return factory
    }
}

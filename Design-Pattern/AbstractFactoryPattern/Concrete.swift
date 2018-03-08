//
//  Concrete.swift
//  AbstractFactoryPattern
//
//  Created by Pszertlek on 2018/3/6.
//  Copyright © 2018年 Pszertlek. All rights reserved.
//

import Foundation

class CompactCarFactory : CarFactory {
    override func createFloorplan() -> FloorPlan {
        return StandardFloorplan()
    }
    override func createSuspension() -> Suspension {
        return RoadSuspension()
    }
    
    override func createDriveTrain() -> DriveTrain {
        return FrontWheelDrive()
    }
}

class SportsCarFactory : CarFactory {
    override func createFloorplan() -> FloorPlan {
        return ShortFloorplan()
    }
    override func createSuspension() -> Suspension {
        return RaceSuspension()
    }
    
    override func createDriveTrain() -> DriveTrain {
        return RearWheelDrive()
    }
}
class SUVCarFactory : CarFactory {
    override func createFloorplan() -> FloorPlan {
        return LongFloorplan()
    }
    override func createSuspension() -> Suspension {
        return OffRoadSuspension()
    }
    
    override func createDriveTrain() -> DriveTrain {
        return AllWheelDrive()
    }
}

//
//  CarsParts.swift
//  AbstractFactoryPattern
//
//  Created by Pszertlek on 2018/3/6.
//  Copyright © 2018年 Pszertlek. All rights reserved.
//

import Foundation

enum Cars: String {
    case compact = "VM Golf"
    case sports = "Porsche Boxter"
    case SUV = "Cadillac Escalade"
}

struct Car {
    var carType: Cars
    var floor: FloorPlan
    var suspension: Suspension
    var drive: DriveTrain
    
    func printDetails() {
        print("Car Type: \(carType.rawValue)")
        print("Seats: \(floor.seats)")
        print("Engine: \(floor.enginePosition.rawValue)")
        print("Suspension: \(suspension.suspensionType.rawValue)")
        print("Drive: \(drive.driveType.rawValue)")
    }
    
    init(carType: Cars) {
        let factory = CarFactory.getFactory(car: carType)
        self.carType = carType
        self.floor = factory.createFloorplan()
        self.suspension = factory.createDriveTrain() as! Suspension
        self.drive = factory.createSuspension() as! DriveTrain
    }
}

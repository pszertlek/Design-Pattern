//
//  Drivetains.swift
//  AbstractFactoryPattern
//
//  Created by Pszertlek on 2018/3/6.
//  Copyright © 2018年 Pszertlek. All rights reserved.
//

import Foundation

protocol DriveTrain {
    var driveType: DriveOption { get }
}

enum DriveOption: String {
    case front = "front"
    case rear = "Rear"
    case all = "4WD"
}

class FrontWheelDrive: DriveTrain {
    var driveType: DriveOption = .front
}

class RearWheelDrive: DriveTrain {
    var driveType: DriveOption = .rear
}
class AllWheelDrive: DriveTrain {
    var driveType: DriveOption = .all
}

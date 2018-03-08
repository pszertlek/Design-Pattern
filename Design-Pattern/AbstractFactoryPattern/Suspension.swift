//
//  Suspension.swift
//  AbstractFactoryPattern
//
//  Created by Pszertlek on 2018/3/6.
//  Copyright © 2018年 Pszertlek. All rights reserved.
//

import Foundation

protocol Suspension {
    var suspensionType: SuspensionOption { get }
}

enum SuspensionOption: String {
    case standard = "Standard"
    case sports = "Firm"
    case soft = "Soft"
}

class RoadSuspension: Suspension {
    var suspensionType: SuspensionOption = .standard
}

class OffRoadSuspension: Suspension {
    var suspensionType: SuspensionOption = .soft
    
}

class RaceSuspension: Suspension {
    var suspensionType: SuspensionOption = .sports
}



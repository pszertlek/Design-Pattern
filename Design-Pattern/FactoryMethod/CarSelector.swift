//
//  CarSelector.swift
//  FactoryMethod
//
//  Created by Pszertlek on 2018/3/6.
//  Copyright © 2018年 Pszertlek. All rights reserved.
//

import Foundation


class CarSelector {
    class func selectCar(passengers: Int) -> String? {
//        var car: RentalCar?
//        switch passengers {
//        case 0...1:
//            car = Sports
//        case 2...3:
//            car = Compact()
//        case 4...8:
//            car = SUV()
//        case 9...14:
//            car = Minivan()
//        default:
//            car = nil
//        }
//        return car?.name
        return createRentalCar(passengers: passengers)
    }
}


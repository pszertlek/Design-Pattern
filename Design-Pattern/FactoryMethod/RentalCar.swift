//
//  RentalCar.swift
//  FactoryMethod
//
//  Created by Pszertlek on 2018/3/6.
//  Copyright © 2018年 Pszertlek. All rights reserved.
//

import Foundation

protocol RentalCar {
    var name: String { get }
    var passengers: Int { get }
    var pricePerDay: Float { get }
}

class Compact: RentalCar {
    var name = "VW Golf"
    var passengers = 3
    var pricePerDay: Float = 20
}

class Sports: RentalCar {
    var name = "Porche Boxter"
    var passengers: Int = 1
    var pricePerDay: Float = 100
}

class SUV: RentalCar {
    var name = "Cadillac Escalade"
    var passengers: Int = 8
    var pricePerDay: Float = 75
}


class Minivan: RentalCar {
    var name: String = "Chevrolet Express"
    var passengers: Int = 14
    var pricePerDay: Float = 40
}

func createRentalCar(passengers: Int) -> RentalCar? {
    var car: RentalCar?
    switch passengers {
    case 0...1:
        car = Sports()
    case 2...3:
        car = Compact()
    case 4...8:
        car = SUV()
    case 9...14:
        car = Minivan()
    default:
        car = nil
    }
    return car
}

//MARK:使用基类
class RentalCarClass {
    private(set) var name: String
    private(set) var passengers: Int
    private(set) var price: Float
    fileprivate init(name: String, passengers: Int, price: Float) {
        self.name = name
        self.passengers = passengers
        self.price = price
    }
    
    class func createRentalCar(passengers: Int) -> RentalCar? {
        var car: RentalCar?
        switch passengers {
        case 0...3:
            car = Compact()
        case 4...8:
            car = SUV()
        default:
            car = nil
        }
        return car
    }
}

class CompactClass: RentalCarClass {
    fileprivate init() {
        super.init(name: "VW Golf", passengers: 3, price: 20)
    }
}

class SUVClass: RentalCarClass {
    fileprivate init() {
        super.init(name: "Cadillac Escalade", passengers: 8, price: 75)
    }
}

enum CarType {
    case compact
    case suv
}

enum CurrencyFactory {
    static func currency(for country: CarType) -> RentalCarClass {
        
        var car: RentalCar?
        switch passengers {
        case compact:
            car = Compact()
        case suv:
            car = SUV()
        return car
        
    }
}

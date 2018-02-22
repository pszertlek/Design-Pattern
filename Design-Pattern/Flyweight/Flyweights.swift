//
//  Flyweights.swift
//  Flyweight
//
//  Created by Pszertlek on 2018/2/22.
//  Copyright © 2018年 Pszertlek. All rights reserved.
//

import Foundation

protocol Flyweight {
    subscript(index: Coordinate) -> Int? { get set }
    var total: Int {get}
    var count: Int {get}
}

class FlyweightImplementation {
    private let extrinsicData: [Coordinate: Cell]
    private var intrinsicData: [Coordinate: Cell]
    
    private let queue: DispatchQueue
    
    fileprivate init(extrinsic: [Coordinate: Cell]) {
        self.extrinsicData = extrinsic
        self.intrinsicData = Dictionary<Coordinate,Cell>()
        self.queue = DispatchQueue(label: "dataQ", qos: DispatchQoS.background, attributes: DispatchQueue.Attributes.concurrent)
    }
}

extension FlyweightImplementation: Flyweight {
    var total: Int {
        var result = 0
        queue.sync {
            result = extrinsicData.values.reduce(0, { (total, cell) in
                if let intrinsicCell = self.intrinsicData[cell.coordinate] {
                    return  total + intrinsicCell.value
                } else {
                    return total + cell.value
                }
            })
        }
        return result
    }
    
    var count: Int {
        var result = 0
        queue.sync {
            result = self.intrinsicData.count
        }
        return result
    }
    
    
    subscript(key: Coordinate) -> Int? {
        get {
            var result: Int?
            queue.sync {
                if let cell = intrinsicData[key] {
                    result = cell.value
                } else {
                    result = extrinsicData[key]?.value
                }
            }
            return result
        }
        set (value) {
            if (value != nil) {
                queue.sync(flags: DispatchWorkItemFlags.barrier, execute: {
                    intrinsicData[key] = Cell(col: key.col, row: key.row, val: value!)
                })
            }
        }
    }
}

class FlyweightFactory {
//    class func createFlyweight() -> Flyweight {
//        return FlyweightImplementation(extrinsic: extrinsicData)
//    }
    
//    private class let extrinsicData: [Coordinate: Cell] {
//        var results = [(Coordinate,Cell)]()
//        let letters: String = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
//        var stringIndex = letters.startIndex
//        let rows = 50
//        
//        repeat {
//            let colLetter = letters[stringIndex]
//            stringIndex = letters.index(after: stringIndex)
//            for rowIndex in 1...rows {
//                let cell = Cell(col: colLetter, row: rowIndex, val: rowIndex)
//                results.append((cell.coordinate,cell))
//            }
//
//        } while (stringIndex != letters.endIndex)
//        return results
//    }
}

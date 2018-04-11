//
//  File.swift
//  Strategy
//
//  Created by Pszertlek on 2018/2/17.
//  Copyright © 2018年 Pszertlek. All rights reserved.
//

import Foundation

protocol Strategy {
    func excute(value: [Int]) -> Int
}

class SumStrategy: Strategy {
    func excute(value: [Int]) -> Int {
        return value.reduce(0, { $0 + $1 })
    }
}

class MultiplyStrategy: Strategy {
    func excute(value: [Int]) -> Int {
        return value.reduce(1, { $0 * $1 })
    }
}

class ClosureStrategy : Strategy {
    private let closure: ([Int]) -> Int
    
    init(_ closure: @escaping ([Int]) -> Int) {
        self.closure = closure
    }
    
    func excute(value: [Int]) -> Int {
        return closure(value)
    }
}

final class List {
    private var numbers: [Int]
    init(_ numbers: Int...) {
        self.numbers = numbers
    }
    
    func addNumber(value: Int) {
        self.numbers.append(value)
    }
    
    func compute(strategy: Strategy) -> Int {
        return strategy.excute(value: numbers)
    }
}

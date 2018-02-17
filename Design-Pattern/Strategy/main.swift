//
//  main.swift
//  Strategy
//
//  Created by Pszertlek on 2018/2/17.
//  Copyright © 2018年 Pszertlek. All rights reserved.
//

import Foundation

//策略模式可以在不修改一个类的情况下扩展其功能
//
print("Hello, World!")

let list = List(1,2,3,4,5,6,7)

list.addNumber(value: 10)
list.addNumber(value: 20)

print(list.compute(strategy: SumStrategy()))

print(list.compute(strategy: MultiplyStrategy()))

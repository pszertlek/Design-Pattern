//
//  main.swift
//  Design-Pattern
//
//  Created by Pszertlek on 2018/2/12.
//  Copyright © 2018年 Pszertlek. All rights reserved.
//

import Foundation

print("Hello, World!")


let queue = DispatchQueue.init(label: "sss", qos: DispatchQoS.default, attributes: DispatchQueue.Attributes.concurrent)

queue.async {
    print("1")
}

queue.async {
    print("2")
}

queue.async {
    print(3)
}

queue.async {
    print(4)
}

queue.async {
    print("1")
}

queue.async {
    print("2")
}

queue.async {
    print(3)
}

queue.async {
    print(4)
}
queue.async {
    print("1")
}

queue.async {
    print("2")
}

queue.async {
    print(3)
}

queue.async {
    print(4)
}


//
//  main.swift
//  ObjectPoolPattern
//
//  Created by Pszertlek on 2018/2/12.
//  Copyright © 2018年 Pszertlek. All rights reserved.
//

import Foundation

let port = Port.init()

//RunLoop.current.add(port, forMode: .commonModes)
//RunLoop.current.run(until: Date.distantFuture)
print("Hello, World!")

var queue = DispatchQueue.init(label: "ss", qos: DispatchQoS.background, attributes: DispatchQueue.Attributes.concurrent, autoreleaseFrequency: DispatchQueue.AutoreleaseFrequency.inherit, target: nil)
var group = DispatchGroup()

print("Start")
for i in 1...20 {
    queue.async(group: group, execute: {
        let book = Library.checkoutBook(reader: "read#\(i)")
        if let thebook = book {
//            Thread.sleep(forTimeInterval: Double(arc4random() % 2))
            print("\(i)")
            Library.returnBook(book: thebook)
        }
    })
}

//group.wait(timeout: DispatchTime.init(uptimeNanoseconds: 5))

group.wait(timeout: DispatchTime.distantFuture)

print("All book complete")

Library.printReport()

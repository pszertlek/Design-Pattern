//
//  Pool.swift
//  ObjectPoolPattern
//
//  Created by Pszertlek on 2018/2/12.
//  Copyright © 2018年 Pszertlek. All rights reserved.
//

import Foundation

class Pool<T> {
    private var data = [T]()
    private let arrayQ = DispatchQueue(label: "arrayQ")
    private let semaphore: DispatchSemaphore
    init(items: [T]) {
        data.reserveCapacity(data.count)
        for item in items {
            data.append(item)
        }
        semaphore = DispatchSemaphore.init(value: data.count)
    }
    
    func getFromPool() -> T? {
        var result: T?
        if (semaphore.wait(timeout: DispatchTime.distantFuture) == DispatchTimeoutResult.timedOut) {
            arrayQ.sync {
                result = self.data.remove(at: 0)
            }
        }
        return result
    }
    
    func returnToPool(item: T) {
        arrayQ.sync {
            self.data.append(item)
            semaphore.signal()
        }
    }
}

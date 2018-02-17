//
//  SportsStore.swift
//  ObjectPoolPattern
//
//  Created by Pszertlek on 2018/2/13.
//  Copyright © 2018年 Pszertlek. All rights reserved.
//

import Foundation

class NetworkConnection {
    private let stockData: [String: Int] = ["Kayak": 40,"lifejacket": 14, "Soccer Ball": 32,"Corner flags": 1, "Stadium": 4,"Thinking Cap": 8, "Unsteady Chair": 3, "Human Chess Board": 2, "Bling-Bling King": 4];
    func getStockLevel(name: String) -> Int? {
        Thread.sleep(forTimeInterval: 0.5)
        return stockData[name]
    }
}

final class NetworkPool {
    private let connectionCount = 3
    private var connections = [NetworkConnection]()
    private var semaphore: DispatchSemaphore
    private var queue: DispatchQueue
    
    static let shared = NetworkPool()
    
    private init() {
        for _ in 0..<connectionCount {
            connections.append(NetworkConnection())
        }
        semaphore = DispatchSemaphore.init(value: connectionCount)
        queue = DispatchQueue.init(label: "ssss")
        
    }
    
    private func doGetConnection() -> NetworkConnection {
        
        semaphore.wait(timeout: DispatchTime.distantFuture)
        var result: NetworkConnection? = nil
        queue.sync {
            result = self.connections.remove(at: 0)
        }
        return result!
    }
    
    private func doReturnConnection(_ connection: NetworkConnection) {
        queue.async {
            self.connections.append(connection)
            self.semaphore.signal()
        }
    }
    
    class func getConnection() -> NetworkConnection {
        return shared.doGetConnection()
    }
    
    class func returnConnection(connection: NetworkConnection) {
        shared.doReturnConnection(connection)
    }
    
}


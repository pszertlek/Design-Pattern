//
//  CustomerAccount.swift
//  DecoratorPattern
//
//  Created by Pszertlek on 2018/2/19.
//  Copyright © 2018年 Pszertlek. All rights reserved.
//

import Foundation

class CustomerAccount {
    let customerName: String
    var purchases = [Purchase]()
    
    init(name: String) {
        customerName = name
    }
    
    func addPurchase(_ purchase: Purchase) {
        self.purchases.append(purchase)
    }
    
    func printAccount() {
        var total: Float = 0
        for p in purchases {
            total += p.totalPrice
            print("Purchase \(p), Price \(formatCurrencyString(number: p.totalPrice))")
        }
    }
    
    func formatCurrencyString(number: Float) -> String {
        let format = NumberFormatter()
        format.numberStyle = .currency
        return format.string(from: number as NSNumber) ?? ""
    }
    
}

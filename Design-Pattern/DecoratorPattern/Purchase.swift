//
//  Purchase.swift
//  DecoratorPattern
//
//  Created by Pszertlek on 2018/2/19.
//  Copyright © 2018年 Pszertlek. All rights reserved.
//

import Foundation

class Purchase: CustomStringConvertible {
    private let product: String
    private let price: Float
    init(product: String, price: Float) {
        self.product = product
        self.price = price
    }
    
    var description: String {
        return product
    }

    var totalPrice: Float {
        return price
    }
}

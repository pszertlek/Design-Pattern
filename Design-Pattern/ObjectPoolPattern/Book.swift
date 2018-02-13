//
//  Book.swift
//  ObjectPoolPattern
//
//  Created by Pszertlek on 2018/2/12.
//  Copyright © 2018年 Pszertlek. All rights reserved.
//

import Foundation

class Book {
    let author: String
    let title: String
    let stockNumber: Int
    var reader: String?
    var checkoutCount = 0
    
    init(author: String, title: String, stock: Int) {
        self.author = author
        self.title = title
        self.stockNumber = stock
    }
}



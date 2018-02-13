//
//  Library.swift
//  ObjectPoolPattern
//
//  Created by Pszertlek on 2018/2/12.
//  Copyright © 2018年 Pszertlek. All rights reserved.
//

import Foundation

final class Library {
    private var books: [Book]
    private let pool: Pool<Book>
    
    private init(stockLevel: Int) {
        books = [Book]()
        for count in 1...stockLevel {
            books.append(Book.init(author: "Dickens", title: "Hard Times", stock: count))
        }
        pool = Pool<Book>(items: books)
    }
    
    private static let singleton = Library.init(stockLevel: 2)
    class func checkoutBook(reader: String) -> Book? {
        let book = singleton.pool.getFromPool()
        book?.reader = reader
        book?.checkoutCount += 1
        return book
    }
    
    class func returnBook(book: Book) {
        book.reader = nil
        singleton.pool.returnToPool(item: book)
    }
    
    class func printReport() {
        for book in singleton.books {
            print("...Book#\(book.stockNumber)...")
            print("check out \(book.checkoutCount) times")
            if let reader = book.reader {
                print("Checked out to \(reader)")
            } else {
                print("In stock")
            }
        }
    }
}

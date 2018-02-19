//
//  main.swift
//  DecoratorPattern
//
//  Created by Pszertlek on 2018/2/19.
//  Copyright © 2018年 Pszertlek. All rights reserved.
//

import Foundation

print("Hello, World!")

let account = CustomerAccount(name: "Joe")

account.addPurchase(Purchase(product: "Red Hat", price: 10))
account.addPurchase(Purchase(product: "Scarf", price: 20))
account.addPurchase(PurchaseWithDelivery(purchase:PurchaseWithGitfwrap(purchase: Purchase(product: "Sunglasses", price: 25))))


account.printAccount()

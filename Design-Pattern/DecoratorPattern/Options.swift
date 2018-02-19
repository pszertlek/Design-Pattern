//
//  Options.swift
//  DecoratorPattern
//
//  Created by Pszertlek on 2018/2/19.
//  Copyright © 2018年 Pszertlek. All rights reserved.
//

import Foundation

class BasePurchaseDecorator: Purchase {
    private let wrappedPurchase: Purchase
    
    init(purchase: Purchase) {
        wrappedPurchase = purchase
        super.init(product: purchase.description, price: purchase.totalPrice)
    }
}

class PurchaseWithGitfwrap: BasePurchaseDecorator {
    override var description: String { return "\(super.description) + giftwrap" }
    override var totalPrice: Float { return super.totalPrice + 2 }
}

class PurchaseWithRibbon: BasePurchaseDecorator {
    override var description: String { return "\(super.description) + ribbon" }
    override var totalPrice: Float { return super.totalPrice + 2 }
}

class PurchaseWithDelivery: BasePurchaseDecorator {
    override var description: String { return "\(super.description) + delivery" }
    override var totalPrice: Float { return super.totalPrice + 2 }
}

class GiftOptionDecorator: Purchase {
    private let wrappedPurchase: Purchase
    private let options: [option]
    enum option {
        case giftWrap
        case ribbon
        case delivery
    }
    
    init(purchase: Purchase, options: option...) {
        self.wrappedPurchase = purchase
        self.options = options
        super.init(product: purchase.description, price: purchase.totalPrice)
    }
    
    override var description: String {
        var result = wrappedPurchase.description
        for option in options {
            switch option {
            case .giftWrap:
                result += "giftwrap"
            case .ribbon:
                result += "ribbon"
            case .delivery:
                result += "delivery"
            }
        }
        return result
    }
    
    override var totalPrice: Float {
        var result = wrappedPurchase.totalPrice
        for option in options {
            switch option {
            case .giftWrap:
                result += 2
            case .ribbon:
                result += 1
            case .delivery:
                result += 5
            }
        }
        return result
    }
}
//此处可能会由于多种组合，代码急速上升
/*
class PurchaseWithGiftWrap: Purchase {
    override var description: String { return "\(super.description) + giftwrap"}
    override var totalPrice: Float { return super.totalPrice + 2 }
}

class PurchaseWithRibbon: Purchase {
    override var description: String { return "\(super.description) + ribbon"}
    override var totalPrice: Float { return super.totalPrice + 1}
}

class PruchaseWithDelivery: Purchase {
    override var description: String { return "\(super.description) + delivery"}
    override var totalPrice: Float { return super.totalPrice + 5 }
}

class PurchaseWithGiftwrapAndDelivery: Purchase {
    override var description: String {
        return "\(super.description) + giftwrap + delivery"
    }
    override var totalPrice: Float { return super.totalPrice + 5 + 2 }
}
*/

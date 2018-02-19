//
//  Messages.swift
//  BridgePattern
//
//  Created by Pszertlek on 2018/2/18.
//  Copyright © 2018年 Pszertlek. All rights reserved.
//

import Foundation

protocol Message {
    init(message: String)
    func prepareMessage()
    var contentToSend: String { get }
}

class ClearMessage: Message {
    private var message: String
    
    required init(message: String) {
        self.message = message
    }
    
    func prepareMessage() {
        // no action required
    }
    
    var contentToSend: String {
        return message
    }

}

class EncrypedMessage: Message {
    private var clearText: String
    private var cipherText: String?
    
    required init(message: String) {
        self.clearText = message
    }
    
    func prepareMessage() {
        cipherText = String(clearText.reversed())
    }
    
    var contentToSend: String {
        return cipherText!
    }
}

protocol Channel {
    func sendMessage(msg: Message)
}

class LandChannel: Channel {
    func sendMessage(msg: Message) {
        
    }
}

class WirelessChannel : Channel {
    func sendMessage(msg: Message) {
        print("wireless: \(msg.contentToSend)")
    }
}


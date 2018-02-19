//
//  Comms.swift
//  BridgePattern
//
//  Created by Pszertlek on 2018/2/18.
//  Copyright © 2018年 Pszertlek. All rights reserved.
//

import Foundation

protocol ClearMessageChannel {
    func send(message: String)
}

protocol SecureMessageChannel {
    func sendEncryptedMessage(encryptedText: String)
}

protocol PriorityMessageChannel {
    func sendPriority( message: String)
}

class Communicator {
    private let clearChannel: ClearMessageChannel
    private let secureChannel: SecureMessageChannel
    init(clearChannel: ClearMessageChannel, secureChannel: SecureMessageChannel) {
        self.clearChannel = clearChannel
        self.secureChannel = secureChannel
    }
    
    func sendClearTextMessage(message: String) {
        self.clearChannel.send(message: message)
    }
    
    func sendSecureMessage(message: String) -> Void {
        self.secureChannel.sendEncryptedMessage(encryptedText: message)
    }
}

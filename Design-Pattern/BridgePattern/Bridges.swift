//
//  Bridges.swift
//  BridgePattern
//
//  Created by Pszertlek on 2018/2/18.
//  Copyright © 2018年 Pszertlek. All rights reserved.
//

import Foundation

class CommunicatorBridge : PriorityMessageChannel, ClearMessageChannel, SecureMessageChannel {
    
    private var channel : Channel
    init(channel: Channel) {
        self.channel = channel
    }
    
    required init(message: String) {
        fatalError("init(message:) has not been implemented")
    }
    
    func send(message: String) {
        let msg = ClearMessage(message: message)
        channel.sendMessage(msg: msg)
    }
    
    func sendPriority(message: String) {
        sendMessage(msg: PriorityMessage(message: message))
    }
    
    
    func sendEncryptedMessage(encryptedText: String) {
        let msg = EncrypedMessage(message: encryptedText)
        sendMessage(msg: msg)
    }
    
    private func sendMessage(msg: Message) {
        msg.prepareMessage()
        channel.sendMessage(msg: msg)
    }
}

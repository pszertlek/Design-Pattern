//
//  Channels.swift
//  BridgePattern
//
//  Created by Pszertlek on 2018/2/18.
//  Copyright © 2018年 Pszertlek. All rights reserved.
//

import Foundation

class LandLine: ClearMessageChannel {
    func send(message: String) {
        print("LandLine: \(message)")
    }
}

class SecureLandLine: SecureMessageChannel {
    func sendEncryptedMessage(encryptedText: String) {
        print("Secure LandLine: \(encryptedText)")
    }
}

class Wireless: ClearMessageChannel {
    func send(message: String) {
        print("Wireless: \(message)")
    }
}

class SecureWireLess: SecureMessageChannel {
    func sendEncryptedMessage(encryptedText: String) {
        print("Secure wireless: \(encryptedText)")
    }
}

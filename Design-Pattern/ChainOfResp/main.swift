//
//  main.swift
//  ChainOfResp
//
//  Created by Pszertlek on 2018/2/22.
//  Copyright © 2018年 Pszertlek. All rights reserved.
//

import Foundation

print("Hello, World!")

let messages = [Message(from: "bob@example.com", to: "joe@example.com", subject: "Free for lunch")]

if let chain = Transmitter.createChain() {
    for msg in messages {
        chain.sendMessage(message: msg)
    }
}

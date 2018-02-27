//
//  Transmitters.swift
//  ChainOfResp
//
//  Created by Pszertlek on 2018/2/22.
//  Copyright © 2018年 Pszertlek. All rights reserved.
//

import Foundation



class Transmitter {
    var nextLink: Transmitter?
    required init() {}
    
    func sendMessage(message: Message) {
        if (nextLink != nil) {
            nextLink?.sendMessage(message: message)
        } else {
            print("end of Chain reached. Message not sent")
        }
    }
    
    class func createChain() -> Transmitter? {
        let transmitterClasses: [Transmitter.Type] = [PriorityTransmitter.self,LocalTransmitter.self,RemoteTransmitter.self]
        var link: Transmitter?
        
        for tClass in transmitterClasses.reversed() {
            let existingLink = link
            link = tClass.init()
            link?.nextLink = existingLink
        }
        return link
    }
    
    fileprivate class func matchEmailSuffix(message: Message) -> Bool {
        if let index = message.from.index(of: "@") {
            return message.to.hasSuffix(String(message.from[Range<String.Index>.init(uncheckedBounds: (index, message.from.endIndex))]))
        }
        return false
    }
}


class LocalTransmitter: Transmitter {
    override func sendMessage(message: Message) {
        if Transmitter.matchEmailSuffix(message: message) {
            print("Message to \(message.to) sent locally")
        } else {
            super.sendMessage(message: message)
        }
    }
    
}

class RemoteTransmitter: Transmitter {
    override func sendMessage(message: Message) {
        if !Transmitter.matchEmailSuffix(message: message) {
            print("Message to \(message) send remotely")
        } else {
            super.sendMessage(message: message)
        }
    }
}

class PriorityTransmitter: Transmitter {
    override func sendMessage(message: Message) {
        if message.subject.hasSuffix("Priority") {
            print("Message to \(message) send priority")
        } else {
            super.sendMessage(message: message)
        }
    }
}

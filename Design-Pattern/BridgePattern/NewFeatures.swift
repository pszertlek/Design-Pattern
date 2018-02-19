//
//  NewFeatures.swift
//  BridgePattern
//
//  Created by Pszertlek on 2018/2/18.
//  Copyright © 2018年 Pszertlek. All rights reserved.
//

import Foundation

class SatelliteChannel : Channel {
    func sendMessage(msg: Message) {
        print("\(msg)")
    }
}

class PriorityMessage: ClearMessage {
    override var contentToSend: String {
        return "Important \(super.contentToSend)"
    }
}



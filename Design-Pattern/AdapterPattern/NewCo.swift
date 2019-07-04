//
//  NewCo.swift
//  AdapterPattern
//
//  Created by Pszertlek on 2018/2/18.
//  Copyright © 2018年 Pszertlek. All rights reserved.
//

import Foundation

class NewCoStaffMember {
    private var name: String
    private var role: String
    
    init(name: String, role: String) {
        self.name = name
        self.role = role
    }
    func getName() -> String {
        return name
    }
    
    func getJob() -> String {
        return role
    }
}

class NewCoDirectory {
    private var staff: [String: NewCoStaffMember]
    
    init() {
        staff = ["Hans": NewCoStaffMember.init(name: "Hans", role: "Corp CounSel"),
                 "Greta": NewCoStaffMember.init(name: "Greta", role: "VP, Legal")]
    }
    
    public func getStaff() -> [String: NewCoStaffMember] {
        return staff
    }
}

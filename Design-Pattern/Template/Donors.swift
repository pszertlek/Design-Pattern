//
//  Donors.swift
//  Template
//
//  Created by Pszertlek on 2018/2/27.
//  Copyright © 2018年 Pszertlek. All rights reserved.
//

import Foundation

struct Donor {
    let title: String
    let firstName: String
    let familyName: String
    let lastDonation: Float
}

/*
class DonorDatabase {
    private var donors: [Donor]
    init() {
        donors = [
            Donor(title: "Ms", firstName: "Anne", familyName: "Jones", lastDonation: 0),
            Donor(title: "Mr", firstName: "Bob", familyName: "Smith", lastDonation: 100),
            Donor(title: "Dr", firstName: "Alice", familyName: "Doe", lastDonation: 200),
            Donor(title: "Prof", firstName: "Joe", familyName: "Davis", lastDonation: 320)
        ]
    }
    
    func generateGalaInvitations(maxNumber: Int) -> [String] {
        var targetDonors: [Donor] = donors.filter($0.lastDonation > 0)
        targetDonors.sort(by: $0.lastDonation > $1.lastDonation )
        if targetDonors.count > maxNumber {
            targetDonors = Array(targetDonors[0..<maxNumber])
        }
        return targetDonors.map( { donor in
            return "Dear \(donor.title). \(donor.familyName)"
        })
    }
}
 */

class DonorDatabase {
    private var donors: [Donor]
    var filter: (([Donor]) -> [Donor])?
    var generate: (([Donor]) -> [String])?
    init() {
        donors = [
            Donor(title: "Ms", firstName: "Anne", familyName: "Jones", lastDonation: 0),
            Donor(title: "Mr", firstName: "Bob", familyName: "Smith", lastDonation: 100),
            Donor(title: "Dr", firstName: "Alice", familyName: "Doe", lastDonation: 200),
            Donor(title: "Prof", firstName: "Joe", familyName: "Davis", lastDonation: 320)
        ]
    }
    
    func generate(maxNumber: Int) -> [String] {
        var targetDonors: [Donor] = filter?(donors) ?? donors.filter( { $0.lastDonation > 0 })
        targetDonors.sort(by: {$0.lastDonation > $1.lastDonation } )
        if targetDonors.count > maxNumber {
            targetDonors = Array(targetDonors[0..<maxNumber])
        }
        return generate?(targetDonors) ?? targetDonors.map( { donor in
            return "Dear \(donor.title). \(donor.familyName)"
        })
    }
}

//此处也可以实现使用子类重载方法方式实现



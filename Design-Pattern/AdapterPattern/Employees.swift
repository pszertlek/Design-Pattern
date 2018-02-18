//
//  Employees.swift
//  AdapterPattern
//
//  Created by Pszertlek on 2018/2/18.
//  Copyright © 2018年 Pszertlek. All rights reserved.
//

import Foundation

struct Employee {
    var name: String
    var title: String
}

protocol EmployeeDataSource {
    var employees: [Employee] { get }
    func search(byName name: String) -> [Employee]
    func search(byTitle title: String) -> [Employee]
}


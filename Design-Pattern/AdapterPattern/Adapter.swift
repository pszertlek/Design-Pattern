//
//  Adapter.swift
//  AdapterPattern
//
//  Created by Pszertlek on 2018/2/18.
//  Copyright © 2018年 Pszertlek. All rights reserved.
//

import Foundation

extension NewCoDirectory: EmployeeDataSource {
    var employees: [Employee] {
        return getStaff().values.map({ (sv) -> Employee in
            return Employee(name: sv.getName(), title: sv.getJob())
        })
    }
    
    func search(byName name: String) -> [Employee] {
        return createEmployees(filter: { (e) -> Bool in
            return e.getName().range(of: name) != nil
        })
    }
    
    func search(byTitle title: String) -> [Employee] {
        return createEmployees(filter: { (e) -> Bool in
            return e.getJob().range(of: title) != nil
        })
    }
    
    private func createEmployees(filter: ((NewCoStaffMember) -> Bool)) -> [Employee] {
        return getStaff().values.filter(filter).map {
            return Employee(name: $0.getName(),title: $0.getJob())
        }
    }
}

//MARK: 还可以使用类适配器


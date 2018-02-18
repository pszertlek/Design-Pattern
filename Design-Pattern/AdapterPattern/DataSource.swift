//
//  DataSource.swift
//  AdapterPattern
//
//  Created by Pszertlek on 2018/2/18.
//  Copyright © 2018年 Pszertlek. All rights reserved.
//

import Foundation

class DataSourceBase: EmployeeDataSource {
    
    var employees = [Employee]()
    
    func search(byTitle title: String) -> [Employee] {
        return search(selector: { (employee) -> Bool in
            return employee.title.range(of: title) != nil
        })
    }
    
    func search(byName name: String) -> [Employee] {
        return search(selector: { (employee) -> Bool in
            return employee.name.range(of: name) != nil
        })
    }
    
    private func search(selector: (Employee) -> Bool) -> [Employee] {
        var results = [Employee]()
        
        for employee in employees {
            if selector(employee) {
                results.append(employee)
            }
        }
        return results
    }
}

class SalesDataSource: DataSourceBase {
    override init() {
        super.init()
        employees.append(Employee(name: "Alice", title: "VP of sales"))
        employees.append(Employee(name: "Bob", title: "Account Exec"))
    }
}

class DevelopmentDataSource: DataSourceBase {
    override init() {
        super.init()
        employees.append(Employee(name: "Joe", title: "VP of Development"))
        employees.append(Employee(name: "Pepe", title: "Developer"))
    }
}

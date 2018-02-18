//
//  EmployeeSearch.swift
//  AdapterPattern
//
//  Created by Pszertlek on 2018/2/18.
//  Copyright © 2018年 Pszertlek. All rights reserved.
//

import Foundation

class SearchTool {
    enum SearchType {
        case name
        case title
    }
    
    private let sources: [EmployeeDataSource]
    
    init(dataSources: [EmployeeDataSource]) {
        sources = dataSources
    }
    
    var employees: [Employee] {
        var results = [Employee]()
        for source in sources {
            results += source.employees
        }
        return results
    }
    
    func search(text: String, type: SearchType) -> [Employee] {
        var results = [Employee]()
        for source in sources {
            results += (type == SearchType.name ? source.search(byName: text) : source.search(byTitle: text))
        }
        return results
    }
}

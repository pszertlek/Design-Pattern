//
//  main.swift
//  AdapterPattern
//
//  Created by Pszertlek on 2018/2/18.
//  Copyright © 2018年 Pszertlek. All rights reserved.
//

import Foundation

print("Hello, World!")

let search = SearchTool(dataSources: [SalesDataSource(), DevelopmentDataSource(),NewCoDirectory()])

print("--List--")

for e in search.employees {
    print("Name: \(e.name)")
}

print("--Search--")

for e in search.search(text: "VP", type: .title) {
    print("Name: \(e.name), title: \(e.title)")
}

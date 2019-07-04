//
//  main.swift
//  Proxy
//
//  Created by Pszertlek on 2018/2/22.
//  Copyright © 2018年 Pszertlek. All rights reserved.
//

import Foundation

print("Hello, World!")

func getHeader(header: String) {
    let url = URL(string: "http://www.apress.com")
    let request = URLRequest(url: url!)
    URLSession.shared.dataTask(with: request) { (data, response, error) in
        if let httpResponse = response as? HTTPURLResponse {
            if let headerValue = httpResponse.allHeaderFields[header] as? String {
                print("\(header): \(headerValue)")
            }
        }
    }.resume()
}
    let headers = ["Content-Length","Content-Encoding"];
    for header in headers {
        getHeader(header: header)
    }

let _ = FileHandle.standardInput.availableData

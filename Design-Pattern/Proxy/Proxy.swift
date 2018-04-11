//
//  File.swift
//  Proxy
//
//  Created by Pszertlek on 2018/2/22.
//  Copyright © 2018年 Pszertlek. All rights reserved.
//

import Foundation

protocol HttpHeaderRequest {
    func getHeader(url: String, header: String) -> String?
}

class HttpHeaderRequestProxy : HttpHeaderRequest {
    private let semaphore = DispatchSemaphore(value: 0)
    let queue = DispatchQueue(label: "httpQ")
    private lazy var cachedHeaders = [String:String]()
    func getHeader(url: String, header: String) -> String? {
        var headerValue: String?
        queue.sync {
            if let cachedValue = self.cachedHeaders[header] {
                headerValue = "\(cachedValue) (cached)"
            } else {
                let url = URL(string: "http://www.apress.com")
                let request = URLRequest(url: url!)
                URLSession.shared.dataTask(with: request) { (data, response, error) in
                    if let httpResponse = response as? HTTPURLResponse {
                        let headers = httpResponse.allHeaderFields as! [String:String]
                        for (name, value) in headers {
                            self.cachedHeaders[name] = value
                        }
                         headerValue = httpResponse.allHeaderFields[header] as? String
                        self.semaphore.signal()
                    }
                    }.resume()
                semaphore.wait(timeout: DispatchTime.distantFuture)

            }
        }
        return headerValue
    }
}

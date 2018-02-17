//
//  ViewController.swift
//  App
//
//  Created by Pszertlek on 2018/2/17.
//  Copyright © 2018年 Pszertlek. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let queue = DispatchQueue.init(label: "sss", qos: DispatchQoS.default, attributes: DispatchQueue.Attributes.concurrent)
        DispatchQueue.apply(attributes: 10,iterations: queue,execute: { size in
            print(size)
            
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


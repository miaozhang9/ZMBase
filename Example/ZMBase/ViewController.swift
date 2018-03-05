//
//  ViewController.swift
//  ZMBase
//
//  Created by miaozhang9 on 03/02/2018.
//  Copyright (c) 2018 miaozhang9. All rights reserved.
//

import UIKit
import ZMBase

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        self.view.backgroundColor = 0x123456.color
        SpringAnimation.springEaseIn(duration: 0.5) {
            
        }
      
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}


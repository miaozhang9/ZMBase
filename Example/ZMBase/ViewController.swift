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
    var socketClient = StompClientLib()
    var titleLab = UILabel();
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        self.view.backgroundColor = 0x123456.color
        SpringAnimation.springEaseIn(duration: 0.5) {
            
        }
       
        websocketStomp()
    }
    
    func websocketStomp() {
        let button = UIButton(frame:CGRect(x:10, y:150, width:100, height:30))
        button.setTitle("WebSocketStomp", for:.normal) //普通状态下的文字
        button.setTitleColor(UIColor.black, for: .normal)
        button.titleLabel?.textColor = UIColor.black
        button.titleLabel?.font = UIFont.systemFont(ofSize: 11)
        button.backgroundColor = UIColor.yellow
        //        button.addTarget(self, action: #selector(click(_:)), for: .touchUpInside)
        button.addTarget(self, action:#selector(send(button:)), for:.touchUpInside)
        self.view.addSubview(button)
    }

    //下
    @objc func send(button:UIButton) {
        
       self.navigationController?.pushViewController(WebSocketStompVC(), animated: true)
    }
    
   
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}


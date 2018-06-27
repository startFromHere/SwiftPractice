//
//  ViewController.swift
//  LTSwiftTest
//
//  Created by 移动支付－刘涛 on 08/01/2018.
//  Copyright © 2018 移动支付－刘涛. All rights reserved.
//

import UIKit
import Foundation

class ViewController: LTBaseVC {
    
    var button:UIButton!
    
    override func viewDidLoad() {
        button = UIButton(frame: CGRect(x: 100, y: 200, width: 200, height: 80))
        button.setTitle("test", for:.normal)
        button.setTitleColor(UIColor.red, for: .normal)
        self.view.addSubview(button)
        button.addTarget(self, action: #selector(gotoTargetVC), for: .touchUpInside)
    }
    
    @objc func gotoTargetVC() {
        let targetVC = LTDynamicAnimatorVC()
        self.navigationController?.pushViewController(targetVC, animated: true)
    }
    
    
}



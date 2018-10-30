//
//  MineVC.swift
//  practice08
//
//  Created by 移动支付－刘涛 on 2018/9/4.
//  Copyright © 2018 移动支付－刘涛. All rights reserved.
//

import UIKit

class MineVC: BaseVC {

    override func viewDidLoad() {
        super.viewDidLoad()

        let testBtn:UIButton = UIButton(frame: CGRect(origin: CGPoint(x: 100, y: 200), size: CGSize(width: 200, height: 100)))
        testBtn.center = self.view.center
        testBtn.setTitle("click me", for: .normal)
        testBtn.backgroundColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
        testBtn.addTarget(self, action: #selector(buttonClicked(_:)), for: .touchUpInside)
        self.view.addSubview(testBtn)
        
    }
    
    @objc func buttonClicked(_ button:UIButton) {
        print("在 mine 页面 点击了button")
    }

}

//
//  LTMainVC.swift
//  MyReader
//
//  Created by 移动支付－刘涛 on 25/01/2018.
//  Copyright © 2018 移动支付－刘涛. All rights reserved.
//

import UIKit

class LTMainVC: LTBaseVC {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.gray
        self.initViwes()
    }
    
    func initViwes() {
        let bookBtn:UIButton = UIButton.init(frame: CGRect(x: 100, y: 200, width: 200, height: 60))
        bookBtn.setTitle("麦田里的守望者", for: UIControlState.normal)
        bookBtn.addTarget(self, action: #selector(startToRead), for: .touchUpInside)
        view.addSubview(bookBtn)
    }
    
    @objc func startToRead() {
        self.showHud(msg: "读取中，请稍后")
        
        let url = Bundle.main.url(forResource: "求魔", withExtension: "txt")
        
        LTParser.parseLocalURL(url: url!) { (bookModel) in
            MBProgressHUD.hide()
            
            
        }
    }

}

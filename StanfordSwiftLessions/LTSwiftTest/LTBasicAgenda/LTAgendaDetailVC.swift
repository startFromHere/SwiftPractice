//
//  LTAgendaDetailVC.swift
//  LTSwiftTest
//
//  Created by 移动支付－刘涛 on 2018/6/28.
//  Copyright © 2018 移动支付－刘涛. All rights reserved.
//

import UIKit

class LTAgendaDetailVC: LTBaseVC {

    var contract:LTContact?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let textView = UITextView(frame: CGRect(x: 0, y: 0, width: 200, height: 300))
        textView.center = self.view.center
        
        textView.layer.borderColor = UIColor.gray.cgColor
        textView.layer.borderWidth = 1
        textView.layer.cornerRadius = 4
        self.view.addSubview(textView)
        
        textView.text = "name:\(contract!.name) surname:\(contract!.surname)\nphone:\(contract!.phone) email:\(contract!.email)"
    }
    
}

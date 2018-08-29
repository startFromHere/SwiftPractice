//
//  LTVC.swift
//  MyReader
//
//  Created by 移动支付－刘涛 on 26/01/2018.
//  Copyright © 2018 移动支付－刘涛. All rights reserved.
//

import UIKit

class LTBaseVC: UIViewController {
    
    var isStatusBarLightContent:Bool = false {

        
        didSet{
            if isStatusBarLightContent != oldValue {
                setStatusBarStyle()
            }
        }
    }
    
    private func setStatusBarStyle() {
        if isStatusBarLightContent {
            UIApplication.shared.setStatusBarStyle(UIStatusBarStyle.lightContent, animated: true)
        } else {
            UIApplication.shared.setStatusBarStyle(UIStatusBarStyle.default, animated: true)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func showHud(msg:String) {
        let view:UIView = UIApplication.shared.windows.first!
        let hud:MBProgressHUD = MBProgressHUD.showAdded(to: view, animated: true)
        hud.label.text = msg
        hud.show(animated: true)
        hud.hide(animated: true, afterDelay: 1.0)
    }

}

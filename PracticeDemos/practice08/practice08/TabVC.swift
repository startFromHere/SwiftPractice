//
//  TabVC.swift
//  practice08
//
//  Created by 移动支付－刘涛 on 2018/9/4.
//  Copyright © 2018 移动支付－刘涛. All rights reserved.
//

import UIKit

class TabVC: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.configTabbar()
    }
    
    func configTabbar() {
        let homeVC = HomeVC()
        homeVC.tabBarItem.title = "home"
        let discoverVC = DiscoverVC()
        discoverVC.tabBarItem.title = "discover"
        let mineVC = MineVC()
        mineVC.tabBarItem.title = "mine"
        
        self.addChildViewController(homeVC)
        self.addChildViewController(discoverVC)
        self.addChildViewController(mineVC)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}

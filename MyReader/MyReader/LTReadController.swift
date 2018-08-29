//
//  LTReadViewController.swift
//  MyReader
//
//  Created by 刘涛 on 2018/8/29.
//  Copyright © 2018 移动支付－刘涛. All rights reserved.
//

import UIKit

class LTReadController: LTBaseVC {
    
    @objc var readModel:LTBookModel!
    
    @objc var openLongMenu:Bool = true
    
//    private(set) var readMenu:LTReadMenu
    
    ///阅读操作对象
    private(set) var readOperation:LTReadOpreration!
    
    ///翻页控制器(仿真)
    private(set) var pageViewController:UIPageViewController?
    
    ///翻页控制器(覆盖、上下)
    private(set) var coverController:LTCover?
    
    ///当前显示的阅读控制器
    private(set) var currentReadVC:LTReadVC?
    

    override func viewDidLoad() {
        super.viewDidLoad()

        isStatusBarLightContent = true
        readOperation = LTReadOpreration
    }
    
    func creatPageController(_ displayController:UIViewController?) {
        
    }
}
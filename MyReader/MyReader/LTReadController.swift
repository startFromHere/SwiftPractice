//
//  LTReadViewController.swift
//  MyReader
//
//  Created by 刘涛 on 2018/8/29.
//  Copyright © 2018 移动支付－刘涛. All rights reserved.
//

import UIKit

class LTReadController: LTBaseVC,UIPageViewControllerDelegate,UIPageViewControllerDataSource {
    
    @objc var readModel:LTBookModel!
    
    @objc var openLongMenu:Bool = true
    
//    private(set) var readMenu:LTReadMenu
    
    ///阅读操作对象
    private(set) var readOperation:LTReadOpreration!
    
    ///翻页控制器(仿真)
    private(set) var pageViewController:UIPageViewController?
    
    ///翻页控制器(覆盖、上下)
    private(set) var coverController:LTcoverController?
    
    ///当前显示的阅读控制器
    private(set) var currentReadVC:LTReadVC?
    

    override func viewDidLoad() {
        super.viewDidLoad()

        isStatusBarLightContent = true
        readOperation = LTReadOpreration(vc: self)
        
        creatPageController(readOperation.getCurrentReadViewController(isUpdateFont: true, isSave: true))
        
        
    }
    
    func creatPageController(_ displayController:UIViewController?) {
        if pageViewController != nil {
            pageViewController?.view.removeFromSuperview()
            pageViewController?.removeFromParentViewController()
            pageViewController = nil
        }
        
        if coverController != nil {
            coverController?.view.removeFromSuperview()
            coverController?.removeFromParentViewController()
            coverController = nil
        }
        
        if LTReadConfigure.shared().effectType == LTEffectType.simulation.rawValue {
            let options = [UIPageViewControllerOptionSpineLocationKey:NSNumber(value: UIPageViewControllerSpineLocation.min.rawValue as Int)]
            pageViewController!.delegate = self
            pageViewController!.dataSource = self
            view.insertSubview(pageViewController!.view, at: 0)
            addChildViewController(pageViewController!)
            pageViewController?.setViewControllers((displayController != nil ? [displayController!] : nil), direction: UIPageViewControllerNavigationDirection.forward, animated: false, completion: nil)
        } else {
            coverController = LTcoverController()
            coverController.de
        }
    }
}

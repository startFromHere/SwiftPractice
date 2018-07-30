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
        super.viewDidLoad()
        self.configUI()
    }

    @objc func gotoTargetVC() {
        let targetVC = AlgorithVC()
        self.navigationController?.pushViewController(targetVC, animated: true)
//        self.performSegue(withIdentifier: "LTFoodMainVC", sender: nil)
        
    }
    
    func configUI(){
        button = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        button.center = self.view.center
        button.layer.borderColor = UIColor.gray.cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 25
        button.layer.masksToBounds = true
        button.setTitle("test", for:.normal)
        button.setTitleColor(UIColor.darkGray, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        self.view.addSubview(button)
        button.addTarget(self, action: #selector(gotoTargetVC), for: .touchUpInside)
    }
}
extension UIViewController {
    func printSth(){
        print("9999999999");
    }
}

//extension UIView {
//    static func == (lhs:UIView, rhs:UIView) -> Bool {
//        return lhs.backgroundColor?.cgColor == rhs.backgroundColor?.cgColor
//    }
//}



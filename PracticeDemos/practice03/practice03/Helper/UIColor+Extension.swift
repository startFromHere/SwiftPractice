//
//  UIColor+Extension.swift
//  practice03
//
//  Created by 移动支付－刘涛 on 2018/8/20.
//  Copyright © 2018 移动支付－刘涛. All rights reserved.
//

import UIKit

public extension UIColor {
    convenience init(r:Int, g:Int, b:Int, a:CGFloat) {
        self.init(red: CGFloat(r)/255, green: CGFloat(g)/255, blue: CGFloat(b)/255, alpha: a)
    }
    
    convenience init(hex:Int) {
        self.init(r: (hex & 0xFF0000) >> 16, g: (hex & 0xFF00) >> 8, b: (hex & 0xFF), a: 1)
    }
}

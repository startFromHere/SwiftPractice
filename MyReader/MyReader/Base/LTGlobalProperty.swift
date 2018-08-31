//
//  LTGlobalProperty.swift
//  MyReader
//
//  Created by 移动支付－刘涛 on 2018/8/31.
//  Copyright © 2018 移动支付－刘涛. All rights reserved.
//

import UIKit

let ScreenWidth:CGFloat = UIScreen.main.bounds.size.width
let ScreenHeight:CGFloat = UIScreen.main.bounds.size.height
let isX:Bool = (ScreenHeight == CGFloat(812) && ScreenWidth == CGFloat(375))
let NavgationBarHeight:CGFloat = isX ? 88 : 64
let TabBarHeight:CGFloat = 49
let TopLiuHeight:CGFloat = 30
let StatusBarHeight:CGFloat = isX ? 44 : 20
let LTColor_1:UIColor = RGB(238, g:224, b:202)
let LTColor_2:UIColor = RGB(205, g: 239, b: 205)
let LTColor_3:UIColor = RGB(206, g: 233, b: 241)
let LTColor_4:UIColor = RGB(251, g: 237, b: 199)  // 牛皮黄
let LTColor_5:UIColor = RGB(51, g: 51, b: 51)

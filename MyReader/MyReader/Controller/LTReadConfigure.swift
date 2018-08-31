//
//  LTReadConfigure.swift
//  MyReader
//
//  Created by 移动支付－刘涛 on 2018/8/31.
//  Copyright © 2018 移动支付－刘涛. All rights reserved.
//

import UIKit

let LTReadConfigureKey:String  = "ReadConfigure"

private var instance:LTReadConfigure? = LTReadConfigure.readInfo()

let LTreadBGColors:[UIColor] = [UIColor.white, LTColor_1, LTColor_2, LTColor_3, LTColor_4, LTColor_5]

let LTReadMinFontSize:NSInteger = 12


let LTReadBGColots:[UIColor] = [UIColor.white,]

class LTReadConfigure: NSObject {
    
    var colotIndex:NSInteger = 0 {didSet{save()}}
    
    var fontType:NSInteger = LTFontType.system.rawValue {didSet{save()}}
    
    var fontSize:NSInteger = LTReadMinFontSize {didSet{save()}}
    
    var effectType:NSInteger = LTEffectType.simulation.rawValue {didSet{save()}}
    
    private init(dict:Any?) {
        super.init()
        setData(dict:dict)
    }
    
    func setData(dict:Any?) {
        if dict != nil {
            setValuesForKeys(dict as! [String : AnyObject])
        }
    }
    
    class func readInfo() -> LTReadConfigure {
        let info = LTUserInfo.objectForKey(LTReadConfigureKey)
        return LTReadConfigure(dict: info)
    }
    
    class func shared() -> LTReadConfigure {
        if instance == nil {
            instance = LTReadConfigure.readInfo()
        }
        return instance!
    }
    
    func save() {
        var dict = allPropertys()
        dict.removeValue(forKey:"lineSpacing")
        dict.removeValue(forKey:"textColor")
        LTUserInfo.setObject(dict, key: LTReadConfigureKey)
    }
    
    
}

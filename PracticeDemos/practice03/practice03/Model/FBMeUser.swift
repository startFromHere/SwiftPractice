//
//  FBMeUser.swift
//  practice03
//
//  Created by 移动支付－刘涛 on 2018/8/20.
//  Copyright © 2018 移动支付－刘涛. All rights reserved.
//

import Foundation

class FBMeUser {
    var name: String
    var avatarName: String
    var education: String
    
    init(name:String, avatarName: String = "bayMax", education: String) {
        self.name = name
        self.avatarName = avatarName
        self.education = education
    }
}

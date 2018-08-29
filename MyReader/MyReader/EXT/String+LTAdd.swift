//
//  String+LTAdd.swift
//  MyReader
//
//  Created by 移动支付－刘涛 on 29/01/2018.
//  Copyright © 2018 移动支付－刘涛. All rights reserved.
//

import Foundation

extension String {
    /**
     截取字符串
     
     - returns: String
     */
    func substring(_ range:NSRange) ->String {
        
        return NSString(string: self).substring(with: range)
    }
    
    var length:Int {
        get{ return (self as NSString).length}
    }
    
    func lastPathComponent() ->String {
        return NSString(string: self).lastPathComponent
    }
    
    func stringByDeletingPathExtension() -> String {
        return NSString(string:self).deletingPathExtension
    }
    
    func replacing(pattern:String, template:String) -> String {
        if isEmpty {
            return self
        }
        
        do {
            let regularExpression = try NSRegularExpression(pattern: pattern, options: NSRegularExpression.Options.caseInsensitive)
            return regularExpression.stringByReplacingMatches(in: self, options: NSRegularExpression.MatchingOptions.reportProgress, range: NSMakeRange(0, length), withTemplate: template)
        } catch { return self}
    }
    
    
}

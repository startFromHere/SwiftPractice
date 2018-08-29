//
//  LTReadModel.swift
//  MyReader
//
//  Created by 移动支付－刘涛 on 21/03/2018.
//  Copyright © 2018 移动支付－刘涛. All rights reserved.
//

import UIKit

class LTChapterListModel: NSObject,NSCoding {
    
    var bookID:String!
    
    var id:String!
    
    var name:String!
    
    var priority:NSNumber!
    
    override init() {
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init()
        
        priority = aDecoder.decodeObject(forKey: "priority") as! NSNumber
        
        bookID = aDecoder.decodeObject(forKey: "bookID") as! String
        
        id = aDecoder.decodeObject(forKey: "id") as! String
        
        name = aDecoder.decodeObject(forKey: "name") as! String
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(priority, forKey: "priority")
        
        aCoder.encode(bookID, forKey: "bookID")
        
        aCoder.encode(id, forKey: "id")
        
        aCoder.encode(name, forKey: "name")
    }
}

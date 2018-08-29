//
//  LTChapterModel.swift
//  MyReader
//
//  Created by 移动支付－刘涛 on 2018/7/11.
//  Copyright © 2018 移动支付－刘涛. All rights reserved.
//

import Foundation

class LTChapterModel: NSObject, NSCoding {
    
    var bookID:String!
    var id:String!
    var lastChapterID:String?
    var nextChapterID:String?
    var name:String!
    var priority:NSNumber!
    var content:String!
    var pageCount = NSNumber(value:0)
    var rangeArray = [NSRange]()
    private var readAttribute:[String:NSObject] = [:]
    
    class func ISExistReadChapterodel(bookID:String, chapterID:String) -> Bool {
        return readKeyedIsExistArchiver(folderName:bookID, fileName: chapterID)
    }
    
    func location(page:NSInteger) -> NSInteger {
        return rangeArray[page].location
    }
    
    func updateFont(isSave:Bool = false) {
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(bookID, forKey: "bookID")
        
        aCoder.encode(id, forKey: "id")
        
        aCoder.encode(lastChapterID, forKey: "lastChapterID")
        
        aCoder.encode(nextChapterID, forKey: "nextChapterID")
        
        aCoder.encode(name, forKey: "name")
        
        aCoder.encode(priority, forKey: "priority")
        
        aCoder.encode(content, forKey: "content")
        
        aCoder.encode(pageCount, forKey: "pageCount")
        
        aCoder.encode(rangeArray, forKey: "rangeArray")
        
        aCoder.encode(readAttribute, forKey: "readAttribute")
    }
    
    override init() {
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init()
        bookID = aDecoder.decodeObject(forKey: "bookID") as! String
        
        id = aDecoder.decodeObject(forKey: "id") as! String
        
        lastChapterID = aDecoder.decodeObject(forKey: "lastChapterID") as? String
        
        nextChapterID = aDecoder.decodeObject(forKey: "nextChapterID") as? String
        
        name = aDecoder.decodeObject(forKey: "name") as! String
        
        priority = aDecoder.decodeObject(forKey: "priority") as! NSNumber
        
        content = aDecoder.decodeObject(forKey: "content") as! String
        
        pageCount = aDecoder.decodeObject(forKey: "pageCount") as! NSNumber
        
        rangeArray = aDecoder.decodeObject(forKey: "rangeArray") as! [NSRange]
        
        readAttribute = aDecoder.decodeObject(forKey: "readAttribute") as! [String:NSObject]
    }
    
    ///通过bookID 章节id 获取阅读章节 没有则创建
    class func readChapterModel(bookID:String, chapterID:String, isUpdateFont:Bool = false) -> LTChapterModel {
        var readChapterModel:LTChapterModel!
        if LTChapterModel.ISExistReadChapterodel(bookID: bookID, chapterID: chapterID) {
            readChapterModel = readKeyedUnarchiver(folderName: bookID, fileName: chapterID) as! LTChapterModel
            if isUpdateFont {
                readChapterModel.updateFont(isSave: true)
            }
        } else {
            readChapterModel = LTChapterModel()
            readChapterModel.bookID = bookID
            readChapterModel.id = chapterID
        }
        
        return readChapterModel
    }
    
    /// 保存
    func save() {
        readKeyedArchiver(folderName: bookID, fileName: id, object: self)
    }
    
}

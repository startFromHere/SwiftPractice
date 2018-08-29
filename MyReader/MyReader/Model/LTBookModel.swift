//
//  LTBookModel.swift
//  MyReader
//
//  Created by 移动支付－刘涛 on 26/01/2018.
//  Copyright © 2018 移动支付－刘涛. All rights reserved.
//

import UIKit

class LTBookModel: NSObject, NSCoding {
    
    var bookID:String!
    
    var isLocalBook:NSNumber = NSNumber(value:1)
    
    var chapterListModels:[LTChapterListModel] = [LTChapterListModel]()
    
    var readRecordModle:LTReadRecordModel!
    
    private(set) var readMarkModels:[LTReadMarkModel] = [LTReadMarkModel]()
    
    private(set) var readMarkModel:LTReadMarkModel?
    
    override init() {
        super.init()
    }
    
    class func bookModel(bookID:String) -> LTBookModel {
        var bookModel:LTBookModel!
        
        if LTBookModel.isExistReadModel(bookID) {
            bookModel = readKeyedUnarchiver(folderName: bookID, fileName: bookID) as! LTBookModel
        } else {
            bookModel = LTBookModel();
            bookModel.bookID = bookID
        }
        
        bookModel.readRecordModle = LTReadRecordModel.readRecordModel(bookID: bookID, isUpdateFont: true, isSave: true)
        return bookModel
    }
    
    class func isExistReadModel(_ bookID:String) -> Bool{
        return true
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init()
        
        bookID = aDecoder.decodeObject(forKey: "bookID") as! String
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(bookID, forKey: "bookID")
    }
    
    func modifyReadRecordModel(chapterID:String, page:NSInteger = 0, isUpdateFont:Bool = false, isSave:Bool = false) {
        readRecordModle.modify(chapterID: chapterID, toPage: page, isUpdateFont: isUpdateFont, isSave: isSave)
    }
    
}

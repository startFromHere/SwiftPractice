//
//  LTReadRecordModel.swift
//  MyReader
//
//  Created by 移动支付－刘涛 on 21/03/2018.
//  Copyright © 2018 移动支付－刘涛. All rights reserved.
//

let LTReadLastPageValue:NSInteger = -1

import UIKit

class LTReadRecordModel: NSObject {
    var isRecordExit:Bool { get{return readChapterModel != nil}}
 
    var bookID:String!
    
    var readChapterModel:LTChapterModel?
    
    var page:NSNumber = NSNumber(value: 0)
    
    class func readRecordModel(bookID:String, isUpdateFont:Bool = false, isSave:Bool = false) -> LTReadRecordModel {
        var readModel:LTReadRecordModel!
        if LTReadRecordModel.isExistReadRecord(bookID: bookID) {
            readModel = readKeyedUnarchiver(folderName: bookID, fileName: (bookID + "ReadRecord")) as! LTReadRecordModel
//            if isUpdateFont {
//                readModel.upda
//            }
        } else {
            
        }
        return readModel!
    }
    
    class func isExistReadRecord(bookID:String) -> Bool {
        return readKeyedIsExistArchiver(folderName: bookID, fileName: (bookID + "ReadRecord"))
    }
    
    func updateFont(isSave:Bool = false) {
        if readChapterModel != nil {
            let location = readChapterModel?.location(page:page.intValue)
            readChapterModel!.updateFont()
        }
    }
    
    func modify(chapterID:String, toPage:NSInteger = 0, isUpdateFont:Bool = false, isSave:Bool = false) {
        if LTChapterModel.ISExistReadChapterodel(bookID: bookID, chapterID: chapterID) {
            readChapterModel = LTChapterModel.readChapterModel(bookID: bookID, chapterID: chapterID, isUpdateFont: isUpdateFont)
            page = (toPage == LTReadLastPageValue) ? NSNumber(value: readChapterModel!.pageCount.intValue - 1) : NSNumber(value: toPage)
            if isSave {save()}
        }
    }
    
    func save() {
        readKeyedArchiver(folderName: bookID, fileName: (bookID + "ReadRecord"), object: self)
    }
}

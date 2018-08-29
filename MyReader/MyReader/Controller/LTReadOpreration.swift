//
//  LTReadOpreration.swift
//  MyReader
//
//  Created by 刘涛 on 2018/8/29.
//  Copyright © 2018 移动支付－刘涛. All rights reserved.
//

import UIKit

class LTReadOpreration: NSObject {
    
    weak var vc: LTReadController!
    
    init(vc:LTReadController) {
        super.init()
        self.vc = vc
    }
    
    func getReadViewController(readRecordModel:LTReadRecordModel?) -> LTReadVC? {
        if readRecordModel != nil {
            let readVC = LTReadVC()
            readVC.readRecordModel = readRecordModel
            readVC.readController = vc
            return readVC
        }
        return nil
    }
    
    func getCurrentReadViewController(isUpdateFont:Bool = false, isSave:Bool = false) -> LTReadVC? {
        if isUpdateFont {
            vc.readModel.readRecordModle.updateFont(isSave: true)
        }
        if isSave {
            readRecordUpdate(readRecordModel: vc.readModel.readRecordModle)
        }
        
        return getReadViewController(readRecordModel: vc.readModel.readRecordModle.copySelf())
    }
    
    func getAboveReadVC() -> LTReadVC? {
        if vc.readModel == nil || !vc.readModel.readRecordModle.isRecordExit {return nil}
        
        var readRecordModel:LTReadRecordModel?
        
        if vc.readModel.isLocalBook.boolValue {
            readRecordModel = vc.readModel.readRecordModle.copySelf()
            
            let id = vc.readModel.readRecordModle.readChapterModel!.id.integerValue()
            
            let page = vc.readModel.readRecordModle.page.intValue
            
            if id == 1 && page == 0 {return nil}
            
            if page == 0 {
                readRecordModel?.modify(chapterID: "\(id - 1)", toPage: LTReadLastPageValue, isUpdateFont: true, isSave: false)
            } else {
                readRecordModel?.page = NSNumber(value: page - 1)
            }
        } else {
            readRecordModel = nil
        }
        
        return getReadViewController(readRecordModel: readRecordModel)
    }
    
    func getBelowReadViewController() -> LTReadVC? {
        if vc.readModel == nil || !vc.readModel.readRecordModle.isRecordExit {return nil}
        
        var readRecordModel:LTReadRecordModel?
        
        if vc.readModel.isLocalBook.boolValue {
            readRecordModel = vc.readModel.readRecordModle.copySelf()
            
            let id = vc.readModel.readRecordModle.readChapterModel!.id.integerValue()
            
            let page = vc.readModel.readRecordModle.page.intValue
            
            let lastPage = vc.readModel.readRecordModle.readChapterModel!.pageCount.intValue - 1
            
            if id == vc.readModel.chapterListModels.count && page == lastPage {return nil}
            
            if page == 0 {
                readRecordModel?.modify(chapterID: "\(id + 1)", isUpdateFont: true)
            } else {
                readRecordModel?.page = NSNumber(value: page + 1)
            }
        } else {
            readRecordModel = nil
        }
        return getReadViewController(readRecordModel: readRecordModel)
    }
    
    func gotoChapter(chapterID:String, toPage:NSInteger = 0) -> Bool {
        if vc.readModel != nil {
            if LTChapterModel.ISExistReadChapterodel(bookID: vc.readModel.bookID, chapterID: chapterID) {
                vc.readModel.modifyReadRecordModel(chapterID: chapterID, page: toPage, isSave: false)
                vc.creatPageController(getCurrentReadViewController(isUpdateFont: true, isSave: true))
                return true
            } else {
                return false
            }
        }
        return false
    }
    
    func readRecordUpdate(readViewController:LTReadVC?, isSave: Bool = true) {
        readRecordUpdate(readRecordModel: readViewController?.readRecordModel, isSave: isSave)
    }
    
    func readRecordUpdate(readRecordModel:LTReadRecordModel?, isSave:Bool = true) {
        if readRecordModel != nil {
            vc.readModel.readRecordModle = readRecordModel
            if isSave {
                vc.readModel.readRecordModle.save()
                
                //进度条更新
                DispatchQueue.main.async { [weak self] ()->Void in
//                    self?.vc.rea
                }
            }
        }
    }
}

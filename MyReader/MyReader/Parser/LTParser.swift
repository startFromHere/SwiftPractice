//
//  LTParser.swift
//  MyReader
//
//  Created by 移动支付－刘涛 on 26/01/2018.
//  Copyright © 2018 移动支付－刘涛. All rights reserved.
//

import UIKit

class LTParser: NSObject {
    
    class func parseLocalURL(url:URL,completed:((_ readModel:LTBookModel) -> ())?){
        DispatchQueue.global().async {
            let book = LTParser.parseLocalURL(url: url)
            DispatchQueue.main.async(execute: {
                if completed != nil {
                    completed!(book)
                }
            })
        }
    }
    
    //解码url
    class func decodeURL(_ url:URL) -> String {
        var content = ""
        
        if url.absoluteString.isEmpty {
            return content
        }
        
        content = EncodeURL(url, encoding: String.Encoding.utf8.rawValue)
        
        if content.isEmpty {
            content = EncodeURL(url, encoding: 0x80000632)
        }
        
        if content.isEmpty {
            content = EncodeURL(url, encoding: 0x80000631)
        }
        
        if content.isEmpty {
            content = ""
        }
        
        return content
    }
    
    private class func EncodeURL(_ url:URL,encoding:UInt) -> String {
        do {
            return try NSString(contentsOf: url, encoding: encoding) as String
        } catch {}
        return ""
    }
    
    class func parseLocalURL(url:URL) -> LTBookModel {
        
        let bookID = getBookID(byUrl: url)
        
        if !LTBookModel.isExistReadModel(bookID) {//不存在model
            let bookModel = LTBookModel.bookModel(bookID: bookID);
            
            let content = LTParser.decodeURL(url)
            
            bookModel.chapterListModels = ParserContent(bookID: bookID, content: content)
            
            return bookModel
            
        }
        
        
        
        return LTBookModel()
    }
    
    class func ContentTypeSetting(content:String) -> String {
        var content = content.replacingOccurrences(of: "\r", with: "")
        content = content.replacing(pattern: "\\s*\\n+\\s*", template: "\n   ")
        return content
    }
    
    private class func ParserContent(bookID:String,content:String) -> [LTChapterListModel] {
        var chapterListModels:[LTChapterListModel] = []
        
        let parten = "第[0-9]一二三四五六七八九十百千]*[章回].*"
        
        var results:[NSTextCheckingResult] = []
        do {
            let regularExpression:NSRegularExpression = try NSRegularExpression(pattern: parten, options: NSRegularExpression.Options.caseInsensitive)
            results = regularExpression.matches(in: content, options: NSRegularExpression.MatchingOptions.reportProgress, range: NSRange(location: 0, length: content.length))
        } catch {
            return chapterListModels
        }
        if !results.isEmpty {
            var lastRange = NSMakeRange(0, 0)
            let count = results.count
            var lastReadChapterModel:LTChapterModel?
            
            for i in 0..<count {
                print("总章节数：\(count) 当前解析到：\(i+1)")
                let range = results[i].range
                let location = range.location
                let readChapterModel = LTChapterModel()
                readChapterModel.bookID = bookID
                readChapterModel.id = "\(i + 1)"
                readChapterModel.priority = NSNumber(value: i)
                if i == 0 {
                    readChapterModel.name = "开始"
                    readChapterModel.content = ContentTypeSetting(content: content.substring(NSMakeRange(0, location)))
                    lastRange = range
                    if readChapterModel.content.isEmpty {continue}
                } else if i == count {
                    readChapterModel.name = content.substring(lastRange)
                    readChapterModel.content = ContentTypeSetting(content: content.substring(NSMakeRange(lastRange.location, content.length - location)))
                } else {
                    readChapterModel.name = content.substring(lastRange)
                    readChapterModel.content = ContentTypeSetting(content: content.substring(NSMakeRange(lastRange.location, location - lastRange.location)))
                }
                
                readChapterModel.updateFont()
                
                //添加章节列表模型
                chapterListModels.append(GetReadChapterListModel(readChapterModel:readChapterModel))
                
                readChapterModel.lastChapterID = lastReadChapterModel?.id
                lastReadChapterModel?.nextChapterID = readChapterModel.id
                
                readChapterModel.save()
                lastReadChapterModel?.save()
                
                lastRange = range
                lastReadChapterModel = readChapterModel
            }
        } else {
            let readChapterModel = LTChapterModel()
            readChapterModel.bookID = bookID
            readChapterModel.id = "1"
            readChapterModel.name = "开始"
            readChapterModel.priority = NSNumber(value: 0)
            readChapterModel.content = ContentTypeSetting(content: content)
            readChapterModel.updateFont()
            chapterListModels.append(GetReadChapterListModel(readChapterModel: readChapterModel))
            readChapterModel.save()
        }
        return chapterListModels
    }
    
    
    /**
     通过阅读章节内容模型 获得 阅读章节列表模型
     
     - parameter readChapterModel: 阅读章节内容模型
     
     - returns: 阅读章节列表模型
     */
    private class func GetReadChapterListModel(readChapterModel:LTChapterModel) ->LTChapterListModel {
        
        let readChapterListModel = LTChapterListModel()
        
        readChapterListModel.bookID = readChapterModel.bookID
        
        readChapterListModel.id = readChapterModel.id
        
        readChapterListModel.name = readChapterModel.name
        
        readChapterListModel.priority = readChapterModel.priority
        
        return readChapterListModel
    }

}

//
//  LTGlobal.swift
//  MyReader
//
//  Created by 移动支付－刘涛 on 29/01/2018.
//  Copyright © 2018 移动支付－刘涛. All rights reserved.
//

import Foundation

private let bookFolderName : String = "BookLib"

func getBookID(byUrl url:URL) -> String {
    return url.path.lastPathComponent().stringByDeletingPathExtension()
}

func readKeyedIsExistArchiver(bookID:String) -> Bool {
    return readKeyedIsExistArchiver(folderName: bookID, fileName: bookID)
}

func readKeyedIsExistArchiver(folderName: String, fileName:String? = nil) -> Bool{
    var path = ((NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true).last! as String) + "/\(bookFolderName)/\(folderName)")
    if fileName != nil {
        path += "/\(fileName!)"
    }
    
    return FileManager.default.fileExists(atPath: path);
}

//bookModel 归档
func readKeyedArchiver(folderName:String,fileName:String,object:AnyObject)  {
    var path = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true).last! + "/\(bookFolderName)/\(folderName)"
    
    if creatFilePath(path) {
        path = path + "/\(fileName)"
        NSKeyedArchiver.archiveRootObject(object, toFile: path)
    }
}

//bookModel 解档
func readKeyedUnarchiver(folderName:String,fileName:String) -> AnyObject?{
    let path = ((NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true).last! as String) + "/\(bookFolderName)/\(folderName)") + "/\(fileName)"
    return NSKeyedUnarchiver.unarchiveObject(withFile: path) as AnyObject?
}

func creatFilePath(_ filePath:String) -> Bool {
    let fileManager = FileManager.default
    
    if fileManager.fileExists(atPath: filePath) {
        return true
    }
    
    do{
        try fileManager.createDirectory(atPath: filePath, withIntermediateDirectories: true, attributes: nil)
        
        return true
    } catch {}
    
    return false
}

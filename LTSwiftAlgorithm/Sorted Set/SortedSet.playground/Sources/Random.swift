import Foundation

public func random(from min:Int, to max:Int) -> Int {
    return min + Int(arc4random_uniform(UInt32(max - min + 1)))
}

extension String {
    public static func random(length:Int = 8) -> String {
        let base = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        var randomString = ""
        var index = 0
        for _ in 0..<length {
            index = Int(arc4random_uniform(UInt32(base.count)))
            randomString += "\(base[base.index(base.startIndex, offsetBy:index)])"
        }
        return randomString
    }
}

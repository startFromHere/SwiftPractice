//
//  SortedSet.swift
//  
//
//  Created by 刘涛 on 2020/3/17.
//

public struct SortedSet<T:Comparable> {
    private var internalSet = [T]()
    
    public init() {}
    
    public var count:Int {
        return internalSet.count
    }
    
    public mutating func insert(_ item:T){
        if exist(item) {return}
        
        for i in 0..<count {
            if internalSet[i] > item {
                internalSet.insert(item, at: i)
                return
            }
        }
        
        internalSet.append(item)
    }
    
    public mutating func remove(_ item:T) {
        if let index = index(of: item) {
            internalSet.remove(at: index)
        }
    }
    
    public func exist(_ item: T) -> Bool {
        return index(of:item) != nil
    }
    
    public func index(of item:T) -> Int? {
        var leftBound = 0
        var rightBound = count - 1
        while leftBound <= rightBound {
            let mid = leftBound + (rightBound - leftBound)/2
            if internalSet[mid] < item {
                rightBound = mid + 1
            } else if internalSet[mid] > item {
                leftBound = mid - 1
            } else if internalSet[mid] == item {
                return mid
            } else {
                //不满足 comparable 的 < 和 > 两个条件，也不满足 equable 的 == 的条件，比如根据成绩排序的学生，两个学生成绩可能相等，但这两个学生不应该满足 ==
                for i in stride(from: mid, to: count - 1, by: 1) {
                    if internalSet[i+1] == item {
                        return i+1
                    } else if internalSet[i] < internalSet[i + 1] {
                        break;
                    }
                }
                
                for i in stride(from: mid, to: 0, by: -1) {
                    if internalSet[i-1] == item {
                        return i - 1
                    } else if internalSet[i] > internalSet[i - 1] {
                        break
                    }
                }
                
                return nil
            }
        }
        return nil
    }
    
    public subscript(index: Int) -> T {
        assert(index >= 0 && index < count)
        return internalSet[index]
    }
    
    public func max() -> T? {
        return count == 0 ? nil : internalSet[count - 1]
    }
    
    public func min() -> T?{
        return count == 0 ? nil : internalSet[0]
    }
    
    public func kLargest(_ k:Int) -> T?{
        return k > count || k <= 0 ? nil : internalSet[count - k]
    }
    
    public func kSmallest(_ k:Int) -> T?{
        return k > count || k <= 0 ? nil : internalSet[k - 1]
    }
    
}

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
        if exist(item) return
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
                print("what! When the code enter in this scope?")
            }
        }
        return nil
    }
    
    public subscript(index: Int) -> T {
        assert(index >= 0 && index < count)
        return internalSet[index]
    }
    
}

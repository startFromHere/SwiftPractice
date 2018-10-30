//: Playground - noun: a place where people can play

import UIKit

func computeIntArray(xs:[Int],transform:(Int)->Int)->[Int]{
    var result:[Int] = []
    for x in xs {
        result.append(transform(x))
    }
    return result
}

func doubleArray(xs:[Int]) -> [Int] {
    return computeIntArray(xs: xs, transform: { (x) -> Int in
        return x * 2
    })
}


let arr = [1,2,3,5]

doubleArray(xs: arr)

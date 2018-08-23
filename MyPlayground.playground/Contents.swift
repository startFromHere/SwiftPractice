//: Playground - noun: a place where people can play

import UIKit

func inc( i: inout Int) -> () -> Int {
    return { i += 1; return i }  // 闭包中截获inout参数i
}

var x = 0
let f = inc(&x)
print(f()) // 输出结果：“1”
print(x) // 输出结果：“0”

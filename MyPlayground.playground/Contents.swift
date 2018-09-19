//: Playground - noun: a place where people can play

import UIKit

//edit in test2
//in git test folder, checkout from remote test1 branch(detached header)

//在 gittest folder 中，添加新分支 test2

func inc( i: inout Int) -> () -> Int {
    return { i += 1; return i }  // 闭包中截获inout参数i
}

var x = 0
let f = inc(&x)
print(f()) // 输出结果：“1”
print(x) // 输出结果：“0”

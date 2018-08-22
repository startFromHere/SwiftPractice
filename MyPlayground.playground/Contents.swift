//: Playground - noun: a place where people can play

import UIKit

enum Direction{
    case up
    case down
    case left
    case right
}

protocol Run {
    func run()
    mutating func changeSpeed(newSpeed:CGFloat)
}

struct Car: Run {
    var numberOfWheels:Int
    var color:UIColor
    var speed:CGFloat
    var direct:Direction
    
    func run() {
        print("car run to \(direct) with speed:\(speed)")
    }
    
    mutating func changeSpeed(newSpeed:CGFloat) {
        speed = newSpeed
    }
    
}

let car = Car(numberOfWheels: 4, color: #colorLiteral(red: 0.5404972071, green: 0.9327014594, blue: 0.6634574151, alpha: 1), speed: 20.0, direct: .right)
car.run()

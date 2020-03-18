import Foundation

public struct Player: Comparable {
    public var name: String
    public var points: Int
    
    public init() {
        name = String.random()
        points = random(from:0, to:1000)
    }
    
    public init(name:String, points:Int) {
        self.name = name
        self.points = points
    }
    
}

public func == (x:Player, y:Player) -> Bool {
    return x.name == y.name && x.points == y.points
}

public func < (x:Player, y:Player) -> Bool {
    return x.points < y.points
}

public func > (x:Player, y:Player) -> Bool {
    return x.points > y.points
}

public func print(player: Player) {
    print("player: \(player.name) | points: \(player.points)")
}

public func print(set:SortedSet<Player>) {
    for i in 0..<set.count {
        print(set[set.count - i - 1])
    }
}

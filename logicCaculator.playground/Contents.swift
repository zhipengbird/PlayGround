import UIKit

let   a  = 15
print(String(format: "%X", a))
print(String(a, radix: 2))
print(String(a, radix: 16))
print(String(a, radix: 8))
let b = a >> 2
print(String(b, radix: 2))
print(String(b, radix: 10))
let c = a << 2
print(String(c, radix: 2))
print(String(c, radix: 10))

 let d  = -15
let f  = ~d+1
~f+1
d>>31

var  num  = 34520
print(String(num, radix: 2))
print(String(num, radix: 10))
num  = ((num & 0xAAAA)>>1) | ((num & 0x55555) << 1)
num  = ((num & 0xCCCC)>>2) | ((num & 0x3333) << 2)
num  = ((num & 0xF0F0)>>4) | ((num & 0x0F0F) << 4)
num  = ((num & 0xFF00)>>8) | ((num & 0x00FF) << 8)
print(String(num, radix: 2))
print(String(num, radix: 10))



protocol FullyNamed{
    var fullName: String{get}
}
struct Person: FullyNamed {
    var fullName: String
}
let tom  = Person(fullName: "Tom jackson")
print("\(tom.fullName)")

class StarShip: FullyNamed{
    var prefix: String?
    var name:String
    init(name:String ,prefix:String? = nil) {
        self.name = name
        self.prefix = prefix
    }
    var fullName: String{
        return(prefix != nil ? prefix! + " " : "" ) + name
    }
}
let star007 = StarShip(name: "Tom", prefix: "Jackson")
print("\(star007.fullName)")

protocol SomeProtocol{
    static func someTypeMethod()
}

protocol RandomNumerGenerator{
    func random() -> Double
    static func randomInt() -> Int
    static func randomFloat() -> Float
}
class LinearCongruentialGenerator: RandomNumerGenerator {
    var lastRandom = 42.0
    let m = 139968.0
    let a  = 3877.0
    let c  = 29573.0
    func random() -> Double {
        lastRandom = ((lastRandom*a+c).truncatingRemainder(dividingBy: m))
        return lastRandom
    }
    static func randomInt() -> Int {
        return Int(arc4random())
    }
    static func randomFloat() -> Float {
        return 1.0
    }

}
let generator = LinearCongruentialGenerator()
print(generator.random())
print(LinearCongruentialGenerator.randomInt())



protocol Togglable{
    mutating func toggle()
}
enum OnOffSwitch:Togglable  {
    case off,on
    mutating func toggle() {
        switch self {
        case .off:
            self = .on
        case.on:
            self = .off
        }
    }
}
var lightSwitch = OnOffSwitch.off
lightSwitch.toggle()
print(lightSwitch)



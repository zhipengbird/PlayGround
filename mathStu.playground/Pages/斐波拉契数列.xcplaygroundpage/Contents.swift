import UIKit

/// 斐波拉契数列公式法
let q = ( 1 + sqrt(5)) / 2
func fabraqi(n: Double) ->  Int {
    return Int((pow(q, Double(n)) - pow((1 - q), n)) / sqrt(5));
}
print(fabraqi(n: 8))

func money(month rate: Double, debt :Double , duration month: Double ) -> Double {
    return (rate * debt) / (1 - pow(1+rate, -month));
} 
let rate = 5.635 / 100 / 12
print(money(month: rate, debt: 880000, duration: 360))


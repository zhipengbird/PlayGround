//: [Previous](@previous)

import UIKit
import Darwin.C.math
/*
 兰德尔数： 一个n(n>=3)位正整数，如果等于它的n个数字的n次幂之各，
 那么该数称为n位兰德尔数（自方幂数）
 n = 3 水仙花数
 n = 4 四叶玫瑰花数
 n = 5 五角星数
 n = 6 六合数
 n = 7 北斗七星数
 n = 8 八仙数
 
*/
func randle(num: Double) -> [Int] {
    var nums:[Int] = []
    let maxNum:Double = pow(10,num) - 1 //上限数
    let minNum:Double = pow(10,num-1) //起始数
    for value in Int(minNum)...Int(maxNum) { //枚举 num位整数
        var temp = value
        var res = 0
        for _ in 1...Int(num) { 
            let bitValue = fmod(Double(temp),10.0) //解析数整数的每位
            res += Int(pow(bitValue,num))///num次幂累加
            temp = Int(floor(Double(temp)/10)) 
        }
        if res == value { //条件判断
            nums.append(value)
        }
        
    }
    return nums
}
print(randle(num: 8))
//: [Next](@next)

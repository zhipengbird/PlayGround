//: [Previous](@previous)

import Foundation

/// 辗转相除法， 又名欧几里得算法(Euclidean algorithm) 两个正整数a和b(a>b)，它们的最大公约数 等于a除以b的余数c和b之间的最大公约数。
func  greatestCommonDivisor(_ firstNum : Int, _ secondNum: Int) -> Int {
    let maxV = max(firstNum,secondNum)
    let minV = min(firstNum,secondNum)
    if maxV % minV == 0 {
        return minV
    }
    return greatestCommonDivisor(maxV % minV, minV)
}
//greatestCommonDivisor(4, 2)
//greatestCommonDivisor(4, 5)
greatestCommonDivisor(1000, 1001)

//更相减损术 两个正整数a和b(a>b)，它们的最大公约数等于 a-b的差值c和较小数b的最大公约数
func  greatestCommonDivisor2(_ firstNum : Int, _ secondNum: Int) -> Int {
    let maxV = max(firstNum,secondNum)
    let minV = min(firstNum,secondNum)
    if maxV % minV == 0 {
        return minV
    }
    return greatestCommonDivisor(maxV - minV, minV)
}
//greatestCommonDivisor2(4, 2)
//greatestCommonDivisor2(4, 5)
greatestCommonDivisor2(1000, 1001)

/*：
 相除法和更相减损术的优势结合起来，在更相减损术的基础上使用 移位运算。
 众所周知，移位运算的性能非常好。对于给出的正整数a和b，不难得到 如下的结论。
 (从下文开始，获得最大公约数的方法getGreatestCommonDivisor被简 写为gcd。)
 当a和b均为偶数时，gcd(a,b) = 2×gcd(a/2, b/2) = 2×gcd(a>>1,b>>1)。
 当a为偶数，b为奇数时，gcd(a,b) = gcd(a/2,b) = gcd(a>>1,b)。
 当a为奇数，b为偶数时，gcd(a,b) = gcd(a,b/2) = gcd(a,b>>1)。
 当a和b均为奇数时，先利用更相减损术运算一次，gcd(a,b) = gcd(b,a- b)，此时a-b必然是偶数，然后又可以继续进行移位运算。
*/
func  greatestCommonDivisor3(_ firstNum : Int, _ secondNum: Int) -> Int {
    let maxV = max(firstNum,secondNum)
    let minV = min(firstNum,secondNum)
    if maxV == minV  {
        return minV
    }
    if maxV & 1 == 0, minV & 1 == 0 {
        return greatestCommonDivisor3(maxV >> 1, minV >> 1) << 1
    }else  if maxV & 1 == 0 , minV & 1 != 0 {
        return greatestCommonDivisor3(maxV >> 1, minV)
    } else if maxV & 1 != 0 , minV & 1 == 0 {
        return greatestCommonDivisor3(maxV, minV >> 1)
    }else {
        return greatestCommonDivisor(maxV - minV, minV)        
    }
}
//greatestCommonDivisor3(4, 2)
//greatestCommonDivisor3(4, 5)
greatestCommonDivisor3(1000, 1001)
//: [Next](@next)

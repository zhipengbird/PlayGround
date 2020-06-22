//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

/*：
 给定一个经过编码的字符串，返回它解码后的字符串。
 
 编码规则为: k[encoded_string]，表示其中方括号内部的 encoded_string 正好重复 k 次。注意 k 保证为正整数。
 
 你可以认为输入字符串总是有效的；输入字符串中没有额外的空格，且输入的方括号总是符合格式要求的。
 
 此外，你可以认为原始数据不包含数字，所有的数字只表示重复的次数 k ，例如不会出现像 3a 或 2[4] 的输入。
 
 示例:
 ```
 s = "3[a]2[bc]", 返回 "aaabcbc".
 s = "3[a2[c]]", 返回 "accaccacc".
 s = "2[abc]3[cd]ef", 返回 "abcabccdcdcdef".
 ```
 */

class Solution {
    public func decodeString(_ s: String) -> String {
        var stack :[(num:Int, res: String)] = []
        var  res = "" 
        var multi:Int = 0
        for char in s {
            if char == "[" {
                stack.append((multi, res))
                res  = "" 
                multi =  0
            }else if char == "]"{
                let qq = stack.popLast()
                let currMulti = qq?.num             
                let lastRes = qq?.res ?? ""
                res  = "\(lastRes)\( generateString(currMulti! ,str: res ) ?? "")"
            }else if  "0" <= char, char <= "9" {
                let val = Int( String(char)) ?? 0
                multi = multi * 10 +  val
            }else {
                res += String(char)
            }
        }
        return res 
    }
    func generateString( _ nums: Int, str: String?) -> String? {
        var res = ""
        for _ in 0..<nums {
            res.append(str ?? "")
        }
        return res
    }   
}
let solution  = Solution()
solution.decodeString("2[abc]3[cd]ef")
let string = "aaabbb" 
//for index in 0 ..< string.count { 
//   let val = string[index]
//   print("\(val)")
//}
//: [Next](@next)

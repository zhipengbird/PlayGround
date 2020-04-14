import UIKit

func reverse<T>(_ chars:inout [T],_ start: Int, _ end: Int){
    var start = start, end  = end
    while start < end {
        chars.swapAt(start, end)
        start += 1
        end -= 1
    }
}
func reverseWords(s: String?) -> String {
    guard let s  = s else { return " " }
    var chars = Array(s), start = 0
    reverse(&chars, start, chars.endIndex - 1)
    
    for i  in 0 ..< chars.endIndex  {
        if (i == chars.endIndex - 1) || (chars[i + 1 ] == " ") {
            reverse(&chars, start, i)
            start = i + 2
        }
    }
    return String(chars)
    
} 
reverseWords(s: "the sky is blue" )

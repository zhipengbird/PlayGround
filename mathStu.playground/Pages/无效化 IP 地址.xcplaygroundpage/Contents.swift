//: [Previous](@previous)

import Foundation

/**
 给你一个有效的 IPv4 地址 address，返回这个 IP 地址的无效化版本。
 
 所谓无效化 IP 地址，其实就是用 "[.]" 代替了每个 "."。
 */
var str = "Hello, playground"
func defangIPaddr(_ address: String) -> String {
    var res : String = ""
    for value in address {
        if value == "." {
            res.append("[.]")
        }else {
            res.append(value)
        }
    }
    return res
}
defangIPaddr("1.1.1.1")



//: [Next](@next)

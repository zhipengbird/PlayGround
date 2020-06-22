//: [Previous](@previous)

import Foundation

func deleteNum(_ num:String, k:Int) -> String {
    var stack:[String] = []
    var count = 0
    guard num.count > k,k > 0 else {
        return num
    }
    for value in num {
        let val = String(value)
        if !stack.isEmpty, stack.last! > val ,count < k {
            print("pop \(stack.popLast())")
            count += 1
        }
        if stack.isEmpty , value == "0"  {
          continue  
        } 
        stack.append(val)  
        print(stack)
    }
    while count < k {
        guard let max = stack.max(), let index = stack.firstIndex(of: max) else { continue }
        print("max\(max)")
        stack.remove(at: index)
        count += 1            
    }
    var res = stack.joined()
    print(res)
    res = res.trimmingCharacters(in: CharacterSet(charactersIn: "0"))
    print(res)
    return res
}
deleteNum("541270936", k:3 )
//: [Next](@next)


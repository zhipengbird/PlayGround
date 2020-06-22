//: [Previous](@previous)

import Foundation

var str = "Hello, playground"
func quicksort<T:Comparable>(array: inout [T], startIndex: Int,endIndex: Int) {
    if startIndex >= endIndex {
        return
    }
    let position = partition(array: &array, startIndex: startIndex, endIndex: endIndex)
    quicksort(array: &array, startIndex: startIndex, endIndex: position - 1)
    quicksort(array: &array, startIndex: position + 1, endIndex: endIndex)
}

func partition<T: Comparable>(array: inout [T], startIndex: Int,endIndex: Int) -> Int {
    let temp: T = array[startIndex]
    var leftIdex = startIndex
    var rightIndex = endIndex
    while leftIdex < rightIndex {
        // 从右边开始比较，比key大的数位置不变
        while leftIdex < rightIndex, array[rightIndex] >= temp {
            rightIndex -= 1
        }
        // 只要出现一个比key小的数，将这个数放入左边i的位置
        array[leftIdex] = array[rightIndex]
        // 从左边开始比较，比key小的数位置不变
        while  leftIdex < rightIndex, array[leftIdex] <= temp {
            leftIdex += 1
        }
         // 只要出现一个比key大的数，将这个数放入右边j的位置
        array[rightIndex] = array[leftIdex]

    }
    // 将key放入i的位置，则左侧数都比key小，右侧数都比key大
    array[leftIdex] = temp
    print(leftIdex,array[leftIdex])
    print(array[startIndex...endIndex])
    return leftIdex;
}

var array = [57, 68, 59, 52, 72, 28, 96, 33, 24]
array = [2,3,5,7,1,4,6,15,5,2,7,9,10,15,9,17,12]
quicksort(array: &array, startIndex: 0, endIndex: array.endIndex - 1)
//: [Next](@next)

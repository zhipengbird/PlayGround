//: [Previous](@previous)

import Foundation

/*: 
 > 冒泡排序是一种交换排诹，两两比较待排序的关键字，并交换不满足次序要求的那对数，直到整个表都满足次序要求
 
 处理流程：  
 相邻元素两两比较，一趟完后，最值出现在未尾/最前
 * 第一趟： 依次比较 相邻两个元素，不断交换（小数放前，大数放后）逐个推进，最值最后出现在第n个元素的位置
 * 第二趟： 依次比较 相邻两个元素，不断交换（小数放前，大数放后） 逐个推进，最值最后出现在第n-1个元素位置
 * ... ...
 * 第n-1趟 依次比较 相邻两个元素，不断交换（小数放前，大数放后）逐个推进，最值出现在第二个元素的位置。
 
 **算法复杂度**  
 冒泡排序的最佳时间复杂度为O(n),即初始状态就是排好序的。冒泡排序的最坏时间复杂度为O(n^2),即初始状态就是逆序的。 冒泡排序的平均时间复杂复杂度为O(n^2)
 */
func bubbleSort<T: Comparable>(array:  inout [T]) ->[T] {
    for i  in 0..<array.count {
        for j  in (i + 1) ..< array.count {
            if array[i] > array[j] {
                array.swapAt(i,j)
            }
        }
    }
    return array
}
func bubbleSort2<T: Comparable>(array:  inout [T]) ->[T] {
    for i  in 0..<array.count {
        var swap = false
        for j  in (i + 1) ..< array.count {
            if array[i] > array[j] {
                array.swapAt(i,j)
                swap = true
            }
        }
        if swap == false {
            break
        }
    }
    return array
}
func bubbleSort3<T: Comparable>(array:  inout [T]) ->[T] {
    var index = array.count - 1
    for _  in 0..<array.count {
        var swap = false
        for j  in 0 ..< index {
            if array[j] > array[j+1] {
                array.swapAt(j,j+1)
                swap = true
                index = j 
            }
        }
        if swap == false {
            break
        }
    }
    return array
}

func bubbleSort4<T: Comparable>(array:  inout [T]) ->[T] {
    
    for index  in 0 ..< array.count/2 {
        var isSorted = true
        for j  in index ..< (array.count - index - 1) {
            if array[j] > array[j+1] {
                array.swapAt(j,j+1)
                isSorted = false
            }
        }
        if isSorted {
            break
        }
        isSorted = true 
        
        for j  in ((index + 1) ..< (array.count - index - 1)).reversed() {
            if array[j] < array[j - 1] {
                array.swapAt(j, j - 1)
                isSorted = false
            }
        }
        if isSorted {
            break
        }
    }
    return array
}
var array:[Int]  = [2,4,2,1,3,9,2,4,5,7,9,3]
var array1:[Int]  = [2,4,2,1,3,9,2,4,5,7,9,3]
var array2:[Int]  = [2,4,2,1,3,9,2,4,5,7,9,3]
var array3:[Int]  = [2,4,2,1,3,9,2,4,5,7,9,3]

bubbleSort(array: &array)
bubbleSort2(array: &array1)
bubbleSort3(array: &array2)
bubbleSort4(array: &array3)



//: [Next](@next)

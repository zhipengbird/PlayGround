//: [Previous](@previous)

import Foundation

/*:
 **思想**  
 数组分成有序区和无序区，初始时整个数组都是无序区，然后每次从无序区选一个最小的元素直接放到有序区的最后，重复这样的操作，直到整个数组变成有序区。

 **处理流程**  
  * 第一趟： 在n个数中找到最小（大）与第一个元素交换位置
  * 第二趟： 在剩下的n-1个元素中找到最小（大）与第二个元素交换
  * 重复这样的操作。。。依次与第三、四个。。。交换位置
  * 第n-1趟，最终实现数据的升序或降序排列
 
 |名称|    时间复杂度 |   空间复杂度|    是否稳定 |  
 |-|-|-|-|  
 |冒泡排序|    O( n^2 )|    O(1)|    是|  
 |插入排序   | O( n^2 ) |   O(1) |   是|  
 |选择排序  |  O( n^2 )   | O(1)   | 否|  
 |堆排序|    O( nlogn )|    O(1)    否|  
 |归并排序|    O( nlogn )|    O(1)    是|  
 |快速排序 |   O( nlogn ) |   O(1)    否|  
 |桶排序    |O( n )    | O(1)    |是|  
 */
func selectorSort<T:Comparable>(_ array: inout [T]) {
    guard  array.count > 1 else { return  }
    for index in 0 ..< array.count {
        var lowest = index
        
        for inner in index + 1 ..< array.count {
            if array[lowest] < array[inner]  {
                lowest = inner
            }
        }
        if index != lowest {
            array.swapAt(lowest, index)
        }
    }
}
var array:[Int]  = [2,4,2,1,3,9,2,4,5,7,9,3]
selectorSort(&array)

//: [Next](@next)


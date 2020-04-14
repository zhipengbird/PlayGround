import UIKit

func binarysearch(sortedElements:[Int], for element: Int) -> Bool {
    var low = 0, high = sortedElements.count - 1
    while low <= high {
        let middle = low + (high - low) / 2
        if sortedElements[middle] == element  {
            return true
        } else if sortedElements[middle] < element {
            low = middle + 1
        } else {
            high = middle - 1
        }
        
    }
    return false
}

let list = [1,2,4,6,7,8,9,11,14,16,18]
print(binarysearch(sortedElements: list, for: 1))

extension Array where Element: Comparable {
    var isSorted: Bool {
        var previousIndex = startIndex
        var currentIndex = startIndex + 1
        while currentIndex != endIndex {
            if self[previousIndex] > self[currentIndex] {
                return false
            }
            previousIndex = currentIndex
            currentIndex += 1
        }
        return true
    }
}
func binarySearch<T: Comparable>(sortedElements: [T], for element: T) -> Bool {
    assert(sortedElements.isSorted, "list is not sorted")
    var low = 0, high = sortedElements.count - 1
    while low <= high {
        let middle = low + (high - low) / 2
        if sortedElements[middle] == element  {
            return true
        } else if sortedElements[middle] < element {
            low = middle + 1
        } else {
            high = middle - 1
        }
        
    }
    return false
}

let list2 = [1,3,4,6,7,8,9,11,14,16,18]
print(binarySearch(sortedElements: list2, for: 1))
print(binarySearch(sortedElements: ["1","2","3","4"], for: "4"))





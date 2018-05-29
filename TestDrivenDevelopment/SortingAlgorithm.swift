//
//  SortingAlgorithm.swift
//  TestDrivenDevelopment
//
//  Created by gourav sharma on 3/28/18.
//  Copyright © 2018 MobileProgramming. All rights reserved.
//

//All sorting algorithm

func implementation()  {
    
    var arr = [8,4,5,2,7,2,6,1,9]
    
    bubbleSort(arr: &arr)
}

/*
 Bubble Sort is the simplest sorting algorithm that works by repeatedly swapping the adjacent elements if they are in wrong order.
 /*Bubble sort is a simple sorting algorithm. This sorting algorithm is comparison-based
 algorithm in which each pair of adjacent elements is compared and the elements are swapped if they are not in order. This algorithm is not suitable for large data sets as its average and worst case complexity are of Ο(n2) where n is the number of items.*/
 
 Example:
 First Pass:
 ( 5 1 4 2 8 ) –> ( 1 5 4 2 8 ), Here, algorithm compares the first two elements, and swaps since 5 > 1.
 ( 1 5 4 2 8 ) –>  ( 1 4 5 2 8 ), Swap since 5 > 4
 ( 1 4 5 2 8 ) –>  ( 1 4 2 5 8 ), Swap since 5 > 2
 ( 1 4 2 5 8 ) –> ( 1 4 2 5 8 ), Now, since these elements are already in order (8 > 5), algorithm does not swap them.
 
 Second Pass:
 ( 1 4 2 5 8 ) –> ( 1 4 2 5 8 )
 ( 1 4 2 5 8 ) –> ( 1 2 4 5 8 ), Swap since 4 > 2
 ( 1 2 4 5 8 ) –> ( 1 2 4 5 8 )
 ( 1 2 4 5 8 ) –>  ( 1 2 4 5 8 )
 Now, the array is already sorted, but our algorithm does not know if it is completed. The algorithm needs one whole pass without any swap to know it is sorted.
 
 Third Pass:
 ( 1 2 4 5 8 ) –> ( 1 2 4 5 8 )
 ( 1 2 4 5 8 ) –> ( 1 2 4 5 8 )
 ( 1 2 4 5 8 ) –> ( 1 2 4 5 8 )
 ( 1 2 4 5 8 ) –> ( 1 2 4 5 8 )
 */

func bubbleSort(arr : inout [Int])  {
    
    var isSwap = false
    for index in 0..<arr.count {
        
        for subIndex in 1..<(arr.count - index) {
            
            if arr[subIndex - 1] > arr[subIndex] {
                
                arr.swapAt(index, subIndex)
                isSwap = true
            }
        }
            
            if !isSwap {
                break;
            }
        }
    
    //Upper Bound of this algorithm (worst case time complexity): O(n*n) -> Big Oh Notation
    //Lower Bound of this algorithm (best case time complexity) :  Ω(n*n) -> Omega Notation
    //Upper Bound < average > lower Bound : θ(n*n) -> Theta notation
}


 /*
 Selection sort is a simple sorting algorithm. This sorting algorithm is an in-plac
 comparison-based algorithm in which the list is divided into two parts, the sorted part
 at the left end and the unsorted part at the right end. Initially, the sorted part is
 empty and the unsorted part is the entire list.
 
 The largest element is selected from the unsorted array and swapped with the rightmost
 element, and that element becomes a part of the sorted array. This process continues
 moving unsorted array boundary by one element to the right.
 
 This algorithm is not suitable for large data sets as its average and worst case
 complexities are of Ο(n2), where n is the number of items.
 */


func selectionSort(arr : inout [Int])  {
    
    var elementIndex = 0
    for index in 0..<arr.count {
        
        elementIndex = index
        for subIndex in 1..<arr.count - 1 {
            
            if arr[elementIndex] > arr[subIndex] {
                elementIndex = subIndex
            }
        }
        arr.swapAt(elementIndex, index)
    }
  
}


//insertion sort is not best sorting algorithm in term of performance but its better that bubble sort and selection sort
/*
 a sub-list is maintained which is always sorted. For example, the lower part of an array is maintained to be sorted. An element which is to be 'insert'ed in this sorted sub-list, has to find its appropriate place and then it has to be inserted there. Hence the name, insertion sort.
 
 The array is searched sequentially and unsorted items are moved and inserted into the sorted sub-list (in the same array). This algorithm is not suitable for large data sets as its average and worst case complexity are of Ο(n2), where n is the number of items.
 */

//[5,1,7,4,5,2,7,1]

func insertionSort(arr : inout [Int]) -> [Int] {
    
     for index in 0..<arr.count {
        
        var subIndex = index
        let value = arr[index]
        
        while subIndex > 0 {
            
            if arr[subIndex - 1] > value {
                
                arr.swapAt(subIndex, subIndex - 1)
            }
            subIndex = subIndex - 1
        }
        
     }
    
    
    return []
}


func quickSort(arr : inout [Int]) -> [Int] {
    
    let pivotValueIndex = arr.count - 1
    let startIndex = 0
    if startIndex < arr.count {
        
      let indexValue =  quickSortWithRandomPivotValue(pivotValue: pivotValueIndex, startIndex: startIndex, arr: &arr)
       _ = quickSortWithRandomPivotValue(pivotValue: indexValue-1, startIndex: 0, arr: &arr)
        _ = quickSortWithRandomPivotValue(pivotValue: indexValue, startIndex: indexValue + 1, arr: &arr)
    }
    return []
}

func quickSortWithRandomPivotValue(pivotValue : Int, startIndex : Int, arr : inout [Int]) -> Int {
    
    //just to track the middle point of the list
    var pointer = startIndex - 1
    
    for index in startIndex..<arr.count {
        
        if arr[index] <= arr[pivotValue] {
            
            pointer = pointer + 1
            
            arr.swapAt(index, pointer)
        }
    }
    return pointer
}

//4,2,5,7,3,1,9,3,5

func mergeSort(arr : [Int]) -> [Int]? {
    
    if arr.count <= 1 {
    
         return nil
    }
    let leftArr = Array(arr[0..<arr.count/2])
    let rightArr = Array(arr[arr.count/2..<arr.count])
   
    return combineArr(leftArr: mergeSort(arr: leftArr)!, rightArr: mergeSort(arr:rightArr)!)
}

func combineArr(leftArr : [Int], rightArr : [Int]) -> [Int] {
    
    var mergeArr : [Int] = []
    var left = leftArr
    var right = rightArr
    
    while left.count > 0 && right.count > 0 {
        
        if (left.first! < right.first!) {
            
            mergeArr.append(left.removeFirst())
            } else {
            mergeArr.append(right.removeFirst())
        }
     }
    return mergeArr
}
        
func heapSort() -> [Int] {
    
    return []
}

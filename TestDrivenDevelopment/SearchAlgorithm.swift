//
//  SearchAlgorithm.swift
//  TestDrivenDevelopment
//
//  Created by gourav sharma on 3/28/18.
//  Copyright © 2018 MobileProgramming. All rights reserved.
//

import Foundation


func linearSearchAlgorithm(arr :inout [Int], searchElement : Int) -> Bool {
    
    for item in arr {
        
        if item == searchElement {
            
            return true
        }
    }
    
    return false
}

//6,4,1,7,5,8,7,5,2,5,8
func binarySearchAlgorithm(arr :inout [Int], searchValue : Int) -> Bool {
    
    if arr.isEmpty {
        return false
    }

    var firstIndex = 0
    var lastIndex = arr.count - 1
    
    while firstIndex <= lastIndex {
        
        let middleIndex = (firstIndex + lastIndex)/2
        
        if arr[middleIndex] == searchValue {
            
            return true
        }
        
        if arr[middleIndex] < searchValue {
            
           lastIndex = middleIndex - 1
            
        } else  if arr[middleIndex] > searchValue {
            
            firstIndex = middleIndex + 1
        }
        
    }
    return false
}

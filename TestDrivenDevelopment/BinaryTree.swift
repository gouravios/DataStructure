//
//  BinaryTree.swift
//  TestDrivenDevelopment
//
//  Created by gourav sharma on 5/12/18.
//  Copyright © 2018 MobileProgramming. All rights reserved.
//

import Foundation


enum BinaryTree1<T : Comparable, Equatable>{
    
    case empty
    indirect case node(BinaryTree1,T,BinaryTree1)
    
    mutating func insert(data : T)  {
        
        self = self.newTreeWithInsertedValue(newValue: data)
    }
    
    private func newTreeWithInsertedValue(newValue : T) -> BinaryTree1
    {
        switch self {
        case .empty:
            return .node(.empty, newValue, .empty)
        case let .node(left , oldValue , right):
            
            if oldValue > newValue {
                
                return .node(left.newTreeWithInsertedValue(newValue: newValue),newValue,right)
                
            } else {
                
                return .node(right, newValue, left.newTreeWithInsertedValue(newValue: newValue))
                
            }
        }
    }
    
    
    
    func treeNodeCount() -> Int {
        
        switch self {
        case .empty:
            return 0
        case let .node(left, _ , rigth):
            
            return left.treeNodeCount() + rigth.treeNodeCount() + 1
        }
    }
    
    func traverseInOrder(travere : (T) -> () ) {
        
    }
    
    func searchValueInTree(value : T) -> Bool {
        
        switch self {
        case .empty:
            return false
        case let .node(left, existingValue , rigth):
            
            if value == existingValue {
                
                return true
            }
            
            if value > existingValue {
                
               rigth.searchValueInTree(value: value)
                
            } else {
                
                left.searchValueInTree(value: value)
            }
        }
        return true
    }
    
    
    
    func breadthFirstSearch(value : T)  {
        
    }
}

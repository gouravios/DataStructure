//
//  BinarySearchTree.swift
//  TestDrivenDevelopment
//
//  Created by gourav sharma on 3/28/18.
//  Copyright © 2018 MobileProgramming. All rights reserved.
//

import Foundation

/*
 Binary Serach Tree with value refernce semantic
 */

/*
 Average time complexity for a binary search tree for the traditional implementation using classes is O(log n), which is considerably faster. Using classes (reference semantics) won't have the copy-on-write behaviour, so you'll be able to insert without making a complete copy of the tree.
 */

func implementationTesting(){
    
    var binaryTree : BinaryTree<Int> = .empty
     binaryTree.insert(data: 6)
     binaryTree.insert(data: 7)
     binaryTree.insert(data: 8)
     binaryTree.insert(data: 2)
     binaryTree.insert(data: 9)
     binaryTree.insert(data: 11)
     binaryTree.insert(data: 3)
     binaryTree.insert(data: 1)
     binaryTree.insert(data: 14)
     binaryTree.insert(data: 18)
    
    //inorder traversal
    
    binaryTree.traverseInOrder { (result) in
        
         print("value is : \(result)")
    }
    
}

//Binary Tree
enum BinaryTree <T : Comparable> {
    
    case empty
    indirect  case node(BinaryTree, T, BinaryTree)
    
    
    mutating func insert(data : T)  {
        
       self = newTreeWithInsertedValue(newValue: data)
     }
    
    //8
    private func newTreeWithInsertedValue(newValue : T) -> BinaryTree
    {
        switch self {
        case .empty:
            return .node(.empty,newValue,.empty)
        case let .node(left, value, right):
            
            if value > newValue {
                
                return .node(left.newTreeWithInsertedValue(newValue: newValue),value,right)
                
            } else {
                return .node(left,value,right.newTreeWithInsertedValue(newValue: newValue))
            }
        }
    }
    
    func nodeCount() -> Int {
        switch self {
        case .empty:
            return 0
        case let .node(left, _, right):
            return left.nodeCount() + right.nodeCount() + 1
        }
    }
    
    func traverseInOrder(process : (T)-> ()) {
        
        switch self {
        case .empty:
            return
        case let .node(left, value, right):
            left.traverseInOrder(process: process)
             process(value)
           
            right.traverseInOrder(process: process)
        }
    }
    
   
    
    func searchAnElement(data : T) -> Bool {
        
        switch self {
        case .empty:
            return false
        case let .node(left, value, right):
            
            if value == data {
                    return true
            }
            
            if data > value {
                
                left.searchAnElement(data: data)
                
            } else {
                
                right.searchAnElement(data: data)
            }
        }
          return false
        
    }
}

extension BinaryTree : CustomStringConvertible  {
    
    var description : String {
        
        switch self {
        case let .node(left, value, right):
             return "value: \(value), left = [" + left.description + "], right = [" + right.description + "]"
        default:
             return ""
        }
    }
}

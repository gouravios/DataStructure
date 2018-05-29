//
//  SingularLinkedList.swift
//  TestDrivenDevelopment
//
//  Created by gourav sharma on 2/22/18.
//  Copyright © 2018 MobileProgramming. All rights reserved.
//

import UIKit

//Singular Linked List Implemetation

//Node class
//Equatable is a Swift protocol that makes it possible to determine whether two values of the same type are considered to be equal using the == and != operators
public class SingleNode <T : Equatable>{
    
    //contain data value (T represent generic type)
    var data : T?
    //nextNodeAddress represent address of next node
    var nextNodeAddress : SingleNode?
    
    //designated initializer
    init(data: T) {
        
        self.data = data
    }
    
    
}

public class LinkedList<T: Equatable> {
    
    //A type alias allows you to provide a new name for an existing type into your program. Type alias do not create new types. They simply provide a new name to an existing type.
    public typealias Node = SingleNode<T>
    
    //create a header node
    private var headNode : Node?
    private var tailNode : Node?
    
    var nodeCount : Int {
        
        return self.countNumberOfNodes()
    }
    
    var isHeaderNode : Bool  {
        
        return headNode != nil
    }
    
    
    //give you the first node that contain data and next node address if any
    var firstNode : Node {
        
        return headNode!
    }
    
    var lastNode : Node {
        
        return tailNode!
    }
    
    //insert node at the begning
    public func insertNodeAtBegining(data : T) {
        
        if isHeaderNode {
            
            let newNode = self.createNewNode(data)
            newNode.nextNodeAddress = headNode
            headNode = newNode
            
        } else {
            headNode = self.createNewNode(data)
        }
    }
    
    //insert node at the end of the list
    public func insertNodeAtLast(data : T) {
        
        let newNode = self.createNewNode(data)
        
        if isHeaderNode {
            if headNode?.nextNodeAddress == nil {
                headNode?.nextNodeAddress = newNode
            } else {
                
                var testNode = headNode?.nextNodeAddress
                //traverse the list
                while testNode?.nextNodeAddress != nil {
                    
                    testNode = testNode?.nextNodeAddress
                }
                testNode?.nextNodeAddress = newNode
            }
            tailNode = newNode
        } else {
            headNode = newNode
        }
    }
        
        //insert element in middle of link list
        
        internal func insertElementInMiddleOfLinkedList(data : T) {
            
            let newNode = self.createNewNode(data)
            
            if isHeaderNode {
                
                if headNode?.nextNodeAddress == nil {
                    headNode?.nextNodeAddress = newNode
                } else {
                    
                    var testNode = headNode
                    var count = countNumberOfNodes()/2
                    
                    //traverse the list
                    while (count > 0) {
                        
                        testNode = testNode?.nextNodeAddress
                        count = count - 1
                    }
                    newNode.nextNodeAddress = testNode?.nextNodeAddress
                    testNode?.nextNodeAddress = newNode
                }
                
            } else {
                
                headNode = newNode
            }
        }
    
    //remove node from the list
    
    internal func removeNodeFromList(data : T) -> (Bool,String)  {
        
        guard self.headNode != nil else {
            return (false, "Item Not Found")
        }
        //Check if the value is at the head
        if self.headNode?.data == data {
            
            self.headNode = self.headNode?.nextNodeAddress!
            return (true,"Node Deleted")
        }
        
        //Traverse the linked list to see if node is in the linked list
        if self.headNode?.data != nil {
            
            var previousNode = headNode
            var testNode = headNode?.nextNodeAddress
            
            while testNode != nil {
                
                if testNode?.data == data {
                    
                    previousNode?.nextNodeAddress = testNode?.nextNodeAddress
                        return (true, "node deleted")
                  
                   
                }
                previousNode = testNode
                testNode = testNode?.nextNodeAddress
            }
            
           
        }
       return (false, "Item not found")
    }
        
        //insert element in middle of link list
        //traverse link list
        //create doubly link list
        //circular doubly link list
        //circular linked list
        //linked list with stack
        
    
    public func solution( N : Int) -> [Int] {
        // write your code in Swift 3.0 (Linux)
        
        var arr = [1,4,5,2,7,5,6]
        return [self.find_min(&arr)]
        
        
    }
    
    public func find_min(_ A: inout [Int]) -> Int {
        var result: Int = 0
        for i in 1..<A.count {
            if A[i] < A[result] {
                result = A[i]
            }
        }
        return A[result]
    }
    
    private func countNumberOfNodes() -> Int{
        
        var count = 0
        if isHeaderNode {
            
            var node = headNode
            var arr = [1,2,3]
            arr.append(3
            )
            while node != nil {
                
                print("node data is\(String(describing: node?.data))")
                count = count + 1
                node = node?.nextNodeAddress
            }
        }
        return count
    }
    
    private func createNewNode(_ value : T) -> Node {
        
        let newNode = Node(data: value)
        return newNode
    }
    
}




//
//  DoubleLinkedList.swift
//  TestDrivenDevelopment
//
//  Created by gourav sharma on 2/22/18.
//  Copyright © 2018 MobileProgramming. All rights reserved.
//

import UIKit

//This is double linkedlist node
class DoubleNode < T : Equatable> {
    
    var previousNode : DoubleNode?
    var nextNode : DoubleNode?
    var test : Array<Any>?
    var dataValue : T?
    init(dataValue : T) {
        self.dataValue = dataValue
    }
    
}

class DoubleLinkedList <T : Equatable>  {
    
    typealias Node = DoubleNode<T>
    private var headNode : Node? = nil
    private var tailNode : Node? = nil

    var firstNode : Node?  {
        
        return headNode
    }
    
    var lastNode : Node?  {
        
        return tailNode
    }
    
    var count : Int {
        
        return self.countNumberOfNodes()
    }
    
    var isHeaderAvialable : Bool {
        
        return headNode != nil
    }
    
    private func createNode(data : T) -> Node {
        
        let newNode = Node(dataValue: data)
        return newNode
    }
    
    internal func insertElementAtTheBeginning(data : T) {
        
        let newNode = self.createNode(data: data)
        if isHeaderAvialable {
            
            newNode.nextNode = headNode?.nextNode
            headNode?.nextNode = newNode
            newNode.previousNode = headNode
        
        } else {
             headNode = newNode
        }
    }
    
    //Time complexity for this program is O(n)
    internal func insertElementAtTheEnd(data : T) {
        
        let newNode = self.createNode(data: data)
        if isHeaderAvialable {
            
            //traverse node till the end
            
            if headNode?.nextNode == nil {
                
                headNode?.nextNode = newNode
                newNode.previousNode = headNode
            }
            
            var checkNode = headNode
            while checkNode?.nextNode != nil {
                
                checkNode = checkNode?.nextNode
            }
            checkNode?.nextNode = newNode
            newNode.previousNode = checkNode
            
        } else {
            
            headNode = newNode
        }
    }
    
    internal func deleteElementFromTheList(data : T) {
        
         if isHeaderAvialable {
            
                var element = headNode
                var previousElement: Node?
                while element?.nextNode != nil && element?.dataValue != data {
                    
                    previousElement = element
                    element = element?.nextNode
                }
                previousElement?.nextNode = element?.nextNode
                let node = previousElement?.nextNode
                node?.previousNode = previousElement
         }
    }
    
    private func countNumberOfNodes() -> Int {
        
        var count = 0
        if isHeaderAvialable {
            var node = headNode
            while node != nil {
                print("node data is\(String(describing: node?.dataValue))")
                count = count + 1
                node = node?.nextNode
            }
            
        }
        return count
    }
    
}

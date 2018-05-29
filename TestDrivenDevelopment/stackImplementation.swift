//
//  stackImplementation.swift
//  TestDrivenDevelopment
//
//  Created by gourav sharma on 5/18/18.
//  Copyright © 2018 MobileProgramming. All rights reserved.
//

import Foundation


func test() {
    
    let stack = Stack<Int>()
    stack.push(value: 5)
    stack.push(value: 6)
    stack.push(value: 7)
    stack.push(value: 8)
    
    stack.pop()
}

class Node <T: Equatable>  {
    
    var value : T?
    var nextItem : Node<T>?
    
    init(value : T) {
        self.value = value
    }
}

//public struct Stack<T> {
//    
//    public init()
//    
//    public mutating func push(_ element: T)
//    
//    public mutating func pop() -> T?
//    
//    public func peek() -> T?
//}

class Stack <T: Equatable> {
    
    typealias NodeItem = Node<T>
    
    var topNode : NodeItem?
    
    func push(value : T)  {

        let oldNode = topNode
        topNode = NodeItem(value: value)
        topNode?.nextItem = oldNode
    
    }
    
    func pop() -> NodeItem? {
        
        guard topNode != nil else {
            return nil
        }
        let node = topNode
        topNode = node?.nextItem
        return node
    }
    
     
   public  func peek() -> T?
    {
        return topNode?.value
    }
    
}

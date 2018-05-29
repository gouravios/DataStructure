//
//  QueueImplementation.swift
//  TestDrivenDevelopment
//
//  Created by gourav sharma on 5/21/18.
//  Copyright © 2018 MobileProgramming. All rights reserved.
//

import Foundation

func queueImplementation() {
    
    let queue = Queue<String>()
    queue.enqueueValue(data: "One")
    queue.enqueueValue(data: "two")
    queue.enqueueValue(data: "three")
    queue.enqueueValue(data: "four")
    queue.enqueueValue(data: "five")
    queue.enqueueValue(data: "six")
    queue.enqueueValue(data: "seven")
    
     _ = queue.dequeueValue()
    queue.traverseQueue(headerNode: queue.firstNode)
     _ = queue.dequeueValue()
    queue.traverseQueue(headerNode: queue.firstNode)
     _ = queue.dequeueValue()
    queue.traverseQueue(headerNode: queue.firstNode)
}


class QueueNode <T : Equatable> {
    
    var data : T?
    var previousNode : QueueNode<T>?
    
    init(data : T) {
        self.data = data
    }
}

internal class Queue <T : Equatable> {
    
    typealias QueueNode1 = QueueNode<T>
    
    var firstNode : QueueNode1?
    var lastNode : QueueNode1?
    
    private func createNode(data : T) -> QueueNode1  {
        
        let node = QueueNode(data: data)
        return node
    }
    
    public func enqueueValue(data : T) {
        
         let node = createNode(data: data)
        guard firstNode != nil else {
            
            self.firstNode = node
            self.lastNode = node
            return
        }
        
        lastNode?.previousNode = node
        self.lastNode = node
    }
    
    
    public func dequeueValue() -> T? {
      
        guard firstNode != nil  else {
            return nil
        }
        
        let node = self.firstNode
        self.firstNode = node?.previousNode
        return node?.data
    }
    
    func traverseQueue(headerNode : QueueNode1?) {
        
        guard headerNode != nil  else {
            print("No element found!")
            return
        }
        
        print("data is \(String(describing: headerNode?.data))")
        
        traverseQueue(headerNode: headerNode?.previousNode)
    }
}

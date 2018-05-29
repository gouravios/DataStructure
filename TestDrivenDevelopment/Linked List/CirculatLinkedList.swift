//
//  CirculatLinkedList.swift
//  TestDrivenDevelopment
//
//  Created by gourav sharma on 2/26/18.
//  Copyright © 2018 MobileProgramming. All rights reserved.
//

import UIKit

class CircularNode < T : Equatable > {
    
    var data : T?
    var nextNode : CircularNode?
    
    init(data : T) {
        
        self.data = data
    }

}

class CircularLinkedList < T: Equatable > {
    
    typealias Node = CircularNode<T>
    private var headerNode : Node? = nil
    private var trailerNode : Node? = nil
    
    var firstNode : Node {
        return headerNode!
    }
    
    var lastNode : Node {
         return trailerNode!
    }
    
    var count : Int {
        return 0
    }
    
    var isHeaderAvialable : Bool {
        
        return headerNode != nil
    }
    
    func objectAt(index : Int) -> Node? {
        
        return nil
    }
    
    func insertAtBegining(data : T) {
        let newNode = self.createNode(data: data)
        if isHeaderAvialable {
            newNode.nextNode = headerNode
            headerNode?.nextNode = newNode
        } else {
            headerNode = newNode
        }
    }
    
    func insertAtLast(data : T) {
        
        let newNode = self.createNode(data: data)
        if isHeaderAvialable {
           
            var node = headerNode?.nextNode
            
          //  checkNode?.nextNode != nil
            
            while node?.data != self.firstNode.data {
                
                node = node?.nextNode
            }
            node?.nextNode
           
            
        } else {
            headerNode = newNode
        }
        
    }
    
    func deleteNode(data : T) {
        
    }
    
    func searchNode(data : T) {
        
    }
    
    private func createNode(data : T) -> Node {
    
         let node = Node(data: data)
         return node
    }
    
    private func traverse() -> Int {
        
        return 0
    }
    
}

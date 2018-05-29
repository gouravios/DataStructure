//
//  BinaryTreeTest.swift
//  TestDrivenDevelopment
//
//  Created by gourav sharma on 5/21/18.
//  Copyright © 2018 MobileProgramming. All rights reserved.
//

import Foundation



class BTreeNode : Equatable{
    
    static func ==(lhs: BTreeNode, rhs: BTreeNode) -> Bool {
        
        return true
    }
    
    var val: Int
    
    var left: BTreeNode?
    
    var right: BTreeNode?
    
    init(val: Int) {
        self.val = val
    }
}

class BSTree {
    var root: BTreeNode?
    
    func insert(val: Int) {
        if self.root == nil {
            self.root = BTreeNode(val: val)
        } else {
            self.insert(val: val, node: self.root!)
        }
    }
    
    func insert(val: Int, node: BTreeNode) {
        if val > node.val {
            if node.right == nil {
                node.right = BTreeNode(val: val)
            } else {
                self.insert(val: val, node: node.right!)
            }
        } else {
            if node.left == nil {
                node.left = BTreeNode(val: val)
            } else {
                self.insert(val: val, node: node.left!)
            }
        }
    }
    
    func contains(val: Int) -> Bool {
        return self.contains(val: val, node: self.root!)
    }
    
    func contains(val: Int, node: BTreeNode) -> Bool {
        if val == node.val {
            return true
        }
        
        if val > node.val && node.right != nil {
            return self.contains(val: val, node: node.right!)
        }
        
        if val < node.val && node.left != nil {
            return self.contains(val: val, node: node.left!)
        }
        
        return false
    }
    
    func preorder() {
        self.preorder(node: self.root!)
    }
    
    func preorder(node: BTreeNode) {
        print(node.val)
        if node.left != nil {
            preorder(node: node.left!)
        }
        if node.right != nil {
            preorder(node: node.right!)
        }
    }
    
    func inorder() {
        self.inorder(node: self.root!)
    }
    
    func inorder(node: BTreeNode) {
        if node.left != nil {
            inorder(node: node.left!)
        }
        print(node.val)
        
        if node.right != nil {
            inorder(node: node.right!)
        }
    }
    
    func breadthFirstSearch(node : BTreeNode) -> [BTreeNode]{
        
        let queue = Queue<BTreeNode>()
        var traverseArr = [BTreeNode]()
        
        queue.enqueueValue(data: node)
        traverseArr.append(node)
        
        while let currentNode = queue.dequeueValue() {
            
            if (currentNode.left != nil) {
                
                queue.enqueueValue(data: currentNode.left!)
                traverseArr.append(currentNode.left!)
                
            }
            
            if (currentNode.right != nil) {
                
                queue.enqueueValue(data: currentNode.right!)
                traverseArr.append(currentNode.right!)
                
            }
            
        }
        return traverseArr
        
    }
}



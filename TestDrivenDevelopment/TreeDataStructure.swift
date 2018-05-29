//
//  TreeDataStructure.swift
//  TestDrivenDevelopment
//
//  Created by gourav sharma on 3/26/18.
//  Copyright © 2018 MobileProgramming. All rights reserved.
//

import Foundation

//            9
//       6        13
//     5   7    12   14


func testTreeFunctionality() {
    
    let fiveElement = TreeNode<String>(data: "5", leftChild: nil, rightChild: nil)
    let sevenElement = TreeNode<String>(data: "7", leftChild: nil, rightChild: nil)
    let twelveElement = TreeNode<String>(data: "12", leftChild: nil, rightChild: nil)
    let fourteenElement = TreeNode<String>(data: "14", leftChild: nil, rightChild: nil)
    let sixElement = TreeNode<String>(data: "6", leftChild: fiveElement, rightChild: sevenElement)
    let thirteenElement = TreeNode<String>(data: "13", leftChild: twelveElement, rightChild:fourteenElement )
    let rootElement = TreeNode<String>(data: "9", leftChild: sixElement, rightChild:thirteenElement )
    
    preTraversal(node: rootElement)
    postTraversal(node: rootElement)
    currentTraversal(node: rootElement)
    
    let node = searchElementInTreeDataStructure(node: rootElement, data: "23")
    
    if node {
        print("item found")
    } else {
        print("item not found")
    }
    
    
}

//Trees: Unlike Arrays, Linked Lists, Stack and queues, which are linear data structures, trees are hierarchical data structures.

//Introduction : The topmost node is called root of the tree. The elements that are directly under an element are called its children.The element directly above something is called its parent.
//elements with no children are called leaves.

/*
Following are common types of Binary Trees.

Full Binary Tree A Binary Tree is full if every node has 0 or 2 children. Following are examples of full binary tree. We can also say a full binary tree is a binary tree in which all nodes except leaves have two children.
       18
    /       \
  15         30
 /  \        /  \
 40    50  100   40
 
 Complete Binary Tree: A Binary Tree is complete Binary Tree if all levels are completely filled except possibly the last level and the last level has all keys as left as possible
                           18
                       /        \
                     15          30
                    /  \        /  \
                  40    50    100   40
 
 
                           18
                        /       \
                      15         30
                     /  \        /  \
                   40    50    100   40
                  /  \   /
                8   7  9
 
 Perfect Binary Tree A Binary tree is Perfect Binary Tree in which all internal nodes have two children and all leaves are at same level.
 Following are examples of Perfect Binaryr Trees.
        18
     /       \
   15         30
*/


class TreeNode <T>  {
    
    var rightChild: TreeNode?
    var leftChild : TreeNode?
    var rootNode : TreeNode?
    
    var data : T?
    init(data : T, leftChild : TreeNode?, rightChild : TreeNode?) {
        self.data = data
        self.rightChild = rightChild
        self.leftChild = leftChild
        
    }
}

/*
Tree Traversals (Inorder, Preorder and Postorder)
Unlike linear data structures (Array, Linked List, Queues, Stacks, etc) which have only one logical way to traverse them, trees can be traversed in different ways. Following are the generally used ways for traversing trees
 
                   1
                 /   \
                2     3
              /   \
             4     5
 
 Depth First Traversals:
 (a) Inorder (Left, Root, Right) : 4 2 5 1 3
 (b) Preorder (Root, Left, Right) : 1 2 4 5 3
 (c) Postorder (Left, Right, Root) : 4 5 2 3 1
 
 Breadth First or Level Order Traversal : 1 2 3 4 5
 */

/*
 Algorithm Preorder(tree)
 1. Visit the root.
 2. Traverse the left subtree, i.e., call Preorder(left-subtree)
 3. Traverse the right subtree, i.e., call Preorder(right-subtree)
 */
func preTraversal(node : TreeNode<String>?) {
    
    guard node != nil else {
        return
    }
    print("preTraversal data is :-> \(String(describing: node?.data))")
    preTraversal(node: node?.leftChild)
    preTraversal(node: node?.rightChild)
}

/*
 Algorithm Inorder(tree)
 1. Traverse the left subtree, i.e., call Inorder(left-subtree)
 2. Visit the root.
 3. Traverse the right subtree, i.e., call Inorder(right-subtree)
 
 */
func currentTraversal(node : TreeNode<String>?) {
    
    guard node != nil else {
        return
    }
    currentTraversal(node: node?.leftChild)
    print("currentTraversal data is :-> \(String(describing: node?.data))")
    currentTraversal(node: node?.rightChild)
}

/*
 Algorithm Postorder(tree)
 1. Traverse the left subtree, i.e., call Postorder(left-subtree)
 2. Traverse the right subtree, i.e., call Postorder(right-subtree)
 3. Visit the root.
*/

func postTraversal(node : TreeNode<String>?) {
    
    guard node != nil else {
        return
    }
    postTraversal(node: node?.leftChild)
    postTraversal(node: node?.rightChild)
    print("postTraversal data is :-> \(String(describing: node?.data))")
}


func searchElementInTreeDataStructure(node : TreeNode<String>?, data : String ) ->  Bool {
    
    guard node != nil else {
        return false
    }
    
    if node?.data == data {
        return true
    }
    
    return searchElementInTreeDataStructure(node: node!.leftChild, data: data) || searchElementInTreeDataStructure(node: node!.rightChild, data: data)
}

/*
 Binary Search Tree
 
 
 */

func checkTreeIsBinaryTreeAlgorithm(node : TreeNode<String>?, data : String ) {
    
    
}





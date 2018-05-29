//
//  GraphAdjacencyList.swift
//  TestDrivenDevelopment
//
//  Created by gourav sharma on 5/17/18.
//  Copyright © 2018 MobileProgramming. All rights reserved.
//

import Foundation


func graphImplementation() {
    
    let adjacencyList = AdjacencyList<String>()
    
    let s = adjacencyList.createVertex(data: "S")
    let a = adjacencyList.createVertex(data: "A")
    let b = adjacencyList.createVertex(data: "B")
    let c = adjacencyList.createVertex(data: "C")
    let d = adjacencyList.createVertex(data: "D")
    let f = adjacencyList.createVertex(data: "F")
    let g = adjacencyList.createVertex(data: "G")
    let e = adjacencyList.createVertex(data: "E")
    
    adjacencyList.createEdge(type: .undirected, source: s, destination: a, value: 20)
     adjacencyList.createEdge(type: .undirected, source: a, destination: b, value: 20)
     adjacencyList.createEdge(type: .undirected, source: a, destination: d, value: 20)
     adjacencyList.createEdge(type: .undirected, source: a, destination: c, value: 20)
     adjacencyList.createEdge(type: .undirected, source: b, destination: d, value: 20)
     adjacencyList.createEdge(type: .undirected, source: d, destination: g, value: 20)
    adjacencyList.createEdge(type: .undirected, source: d, destination: f, value: 20)
    adjacencyList.createEdge(type: .undirected, source: f, destination: e, value: 20)
    
    
   let result = adjacencyList.depthFirstSerachTraversal(startNode: s, endNode: e)
    
//    adjacencyList.createEdge(.undirected, from: s, to: a)
//    adjacencyList.createEdge(.undirected, from: a, to: b)
//    adjacencyList.createEdge(.undirected, from: a, to: d)
//    adjacencyList.createEdge(.undirected, from: a, to: c)
//    adjacencyList.createEdge(.undirected, from: b, to: d)
//    adjacencyList.createEdge(.undirected, from: d, to: g)
//    adjacencyList.createEdge(.undirected, from: d, to: f)
//    adjacencyList.createEdge(.undirected, from: f, to: e)
}

protocol Graphable  {
    associatedtype Element : Hashable
    func createVertex(data : Element) -> Vertex<Element>
    func createEdge(type : EdgeType, source : Vertex<Element>, destination : Vertex<Element>, value : Double?)
    func edgeList(vertex : Vertex<Element>) -> [Edge<Element>]
}

open class AdjacencyList<T: Hashable> {
    
    var adjacencyDict : [Vertex<T>: [Edge<T>]] = [:]
    public init() {}
    
    
    func createVertex(data : T) -> Vertex<T> {
        
        let vertex = Vertex(data: data)
        if adjacencyDict[vertex] == nil {
            
            adjacencyDict[vertex] = []
        }
        return vertex
    }
    
    func createEdge(type : EdgeType, source : Vertex<T>, destination : Vertex<T>, value : Double?) {
        
        switch type {
        case .directed:
            self.addDirectEdge(source: source, destination: destination, value: value)
        default:
            self.addUnDirectEdge(vertices: (source,destination), value: value)
        }
    }
    
    func addDirectEdge( source : Vertex<T>, destination : Vertex<T>, value : Double?) {
        
        let edge = Edge(source: source, destination: destination, weight: value!)
         adjacencyDict[source]?.append(edge) // 2
    }
    
    func addUnDirectEdge(vertices : (Vertex<T>, Vertex<T>), value : Double?) {
       let (source, destination) = vertices
       addDirectEdge(source: source, destination: destination, value: value)
       addDirectEdge(source: destination, destination: source, value: value)
    }
    
    func edges(from source: Vertex<T>) -> [Edge<T>]? {
        return adjacencyDict[source]
    }
    
    func depthFirstSerachTraversal(startNode : Vertex<T>, endNode : Vertex<T> ) -> Stack<Vertex<T>> {
        
        //step 1 - get visited node set and stack
        var visitedNode = Set<Vertex<T>>()
        let stack = Stack<Vertex<T>>()
        
        //step 2 push and insert starting point node
        stack.push(value: startNode)
        visitedNode.insert(startNode)
        
       // In this algorithm, you explore a branch as far as possible until you reach the end of the branch. At that point, you backtrack (go back a step), and explore the next available branch, until you find a way out.
        //step 3 start a lop to traverse every node in graph
        
        outer : while let vertex = stack.peek(), vertex != endNode  {
            
            guard let neigbour = adjacencyDict[vertex], neigbour.count > 0 else {
                
                  _ =  stack.pop()
                       continue
            }
        
        for edge in neigbour {
            
            if !visitedNode.contains(edge.destination!) {
                
                print("\(String(describing: edge.destination?.data))")
                stack.push(value: edge.destination!)
                visitedNode.insert(edge.destination!)
                  print("inner\(stack)")
                continue outer
            }
        }
        
             print("outer\(stack)")
      _ = stack.pop()
    }
        return stack
    }
    
    func breadthFirstSearch(node : Vertex<T>) -> Set<Vertex<T>> {
        
        let queue = Queue<Vertex<T>>()
        var nodesExplored =  Set<Vertex<T>>()
        
        queue.enqueueValue(data: node)
        nodesExplored.insert(node)
        
        while let currentNode = queue.dequeueValue() {
            
            for edge in adjacencyDict[currentNode]! {
                
                if !nodesExplored.contains(edge.destination!) {
                    
                    queue.enqueueValue(data: edge.destination!)
                    nodesExplored.insert(edge.destination!)
                }
            }
        }
        
        return nodesExplored
    }
    
    func routeBetweenTwoNodes(sourceNode : Vertex<T>, destinationNode : Vertex<T>) -> Bool {
        
        let queue = Queue<Vertex<T>>()
        
        queue.enqueueValue(data: sourceNode)
        
        while let currentNode = queue.dequeueValue() {
           
            for edge in adjacencyDict[currentNode]! {
                
                if destinationNode != edge.destination {
                    
                    queue.enqueueValue(data: edge.destination!)
                    
                } else {
                    
                    return true
                }
            }
        }
        
        return false
    }
}



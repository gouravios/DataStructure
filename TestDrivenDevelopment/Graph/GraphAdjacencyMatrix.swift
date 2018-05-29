//
//  GraphAdjacencyMatrix.swift
//  TestDrivenDevelopment
//
//  Created by gourav sharma on 5/17/18.
//  Copyright © 2018 MobileProgramming. All rights reserved.
//

import Foundation


open class AdjacencyMatrixGraph<T: Hashable> {
    
    var verticesArr = [Vertex<T>]()
    var adjacencyMatrixArr = [[Int]]()

    public init() {}
    
    func addNewVertix(data : T) -> Vertex<T>  {
       
        let vertex = Vertex(data: data)
        verticesArr.append(vertex)
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
        
        let sourceIndex = 0
        let destinationIndex = 0
        for (index,vertex) in verticesArr.enumerated() {
            
           
            
        }
    }
    
    func addUnDirectEdge(vertices : (Vertex<T>, Vertex<T>), value : Double?) {
        let (source, destination) = vertices
        addDirectEdge(source: source, destination: destination, value: value)
        addDirectEdge(source: destination, destination: source, value: value)
    }
}

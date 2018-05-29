//
//  Edge.swift
//  TestDrivenDevelopment
//
//  Created by gourav sharma on 5/17/18.
//  Copyright © 2018 MobileProgramming. All rights reserved.
//

import Foundation

public enum EdgeType {
    case directed, undirected
}

struct Edge <T : Hashable>{
   
    public var source : Vertex<T>?
    public var destination : Vertex<T>?
    public let weight : Double
}

extension Edge : Hashable {

    public var hashValue: Int {
        return "\(source)\(destination)\(weight)".hashValue
    }
    
    static public func ==(lhs: Edge<T>, rhs: Edge<T>) -> Bool {
        return lhs.source == rhs.source &&
            lhs.destination == rhs.destination &&
            lhs.weight == rhs.weight
    }
}

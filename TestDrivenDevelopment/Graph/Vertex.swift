//
//  Vertice.swift
//  TestDrivenDevelopment
//
//  Created by gourav sharma on 5/17/18.
//  Copyright © 2018 MobileProgramming. All rights reserved.
//

import Foundation

// vertex can represent pretty much any relationship, whether it’s airline flights, a person, or street addresses.
struct Vertex <T : Hashable> {
    
   public var data : T?
}

extension Vertex : Hashable {
    
    public var hashValue : Int {
        
        return "/(data)".hashValue
    }
    
    static public func ==(lhs: Vertex, rhs: Vertex) -> Bool { // 2
        return lhs.data == rhs.data
    }
}

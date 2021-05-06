//
//  Relationship.swift
//  
//
//  Created by Alsey Coleman Miller on 6/05/21.
//

import Foundation

public class PersonObject {
    
    public let name: String
    
    public private(set) var children = [PersonObject]()
    
    public private(set) weak var parent: PersonObject?
    
    public init(name: String) {
        self.name = name
    }
    
    public func printName() {
        print("I am \(name)")
    }
    
    public func add(child: PersonObject) {
        self.children.append(child)
        child.parent = self // weak reference
    }
    
    public func remove(child: PersonObject) {
        self.children.removeAll(where: { $0 === child })
        child.parent = nil
    }
}

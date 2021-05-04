//
//  Foo.swift
//  
//
//  Created by Alsey Coleman Miller on 4/05/21.
//

import Foundation

public class Foo {
    
    public let name: String
    
    public init(name: String) {
        self.name = name
    }
    
    public func printName() {
        print("I am \(name)")
    }
    
    public func printDate() {
        let date = Date()
        let dateString = Foo.dateFormatter.string(from: date)
        print("The time is \(dateString)")
    }
}

internal extension Foo {
        
    static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .medium
        return formatter
    }()
}

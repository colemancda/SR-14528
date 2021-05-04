//
//  Value.swift
//  
//
//  Created by Alsey Coleman Miller on 4/05/21.
//

import Foundation

public struct FooValue {
    
    public let name: String
    
    public init(name: String) {
        self.name = name
    }
    
    public func printName() {
        print("I am \(name) (Value)")
    }
    
    public func printDate() {
        let date = Date()
        let dateString = FooObject.dateFormatter.string(from: date)
        print("The time is \(dateString)")
    }
}

internal extension FooValue {
    
    static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .medium
        return formatter
    }()
}

//
//  Foo.swift
//  
//
//  Created by Alsey Coleman Miller on 4/05/21.
//

import Foundation

class Foo {
    
    let name: String
    
    init(name: String) {
        self.name = name
    }
    
    func printName() {
        print("I am \(name)")
    }
    
    func printDate() {
        let date = Date()
        let dateString = Foo.dateFormatter.string(from: date)
        print("The time is \(dateString)")
    }
}

private extension Foo {
        
    static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .medium
        return formatter
    }()
}

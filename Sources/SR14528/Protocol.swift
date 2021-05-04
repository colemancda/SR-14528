//
//  Protocol.swift
//  
//
//  Created by Alsey Coleman Miller on 4/05/21.
//

import Foundation

public protocol NameProtocol {
    
    var name: String { get }
    
    func printName()
}

extension FooObject: NameProtocol { }

extension FooValue: NameProtocol { }

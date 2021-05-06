//
//  Protocol.swift
//  
//
//  Created by Alsey Coleman Miller on 6/05/21.
//

import Foundation
import SR14528
import ArgumentParser

extension BugTool {
    
    struct ProtocolWitnessTable: ParsableCommand {
        
        static let configuration = CommandConfiguration(abstract: "Measure the performance of using the protocol witness table")
        
        @Option(default: 1_000_000, help: "Number of times to execute the test code.")
        var iterations: UInt
        
        func run() throws {
            let count = Int(iterations)
            var array = [NameProtocol]()
            array.reserveCapacity(count)
            for index in 0 ..< count {
                // create and retain
                if index % 2 == 0 {
                    let value = FooValue(name: "Test")
                    array.append(value)
                } else {
                    let object = FooObject(name: "Test")
                    array.append(object)
                }
            }
            measure {
                for value in array {
                    let _ = value.name
                }
                
            }
        }
    }
}

//
//  ObjectInitialization.swift
//  
//
//  Created by Alsey Coleman Miller on 6/05/21.
//

import Foundation
import SR14528
import ArgumentParser

extension BugTool {
    
    struct ObjectInitialization: ParsableCommand {
        
        static let configuration = CommandConfiguration(abstract: "Measure the performance of object initialization.")
        
        @Option(default: 1_000_000, help: "Number of times to execute the test code.")
        var iterations: UInt
        
        @_silgen_name("swift_test_object_initialization")
        func run() throws {
            measure {
                for _ in 0 ..< iterations {
                    // create and release
                    var object: FooObject?
                    object = FooObject(name: "Test")
                    _ = object // silence warning, prevent optimization
                    object = nil
                }
            }
        }
    }
}

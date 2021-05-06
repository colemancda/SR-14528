//
//  ValueWithReferenceTypesInitialization.swift
//  
//
//  Created by Alsey Coleman Miller on 6/05/21.
//

import Foundation
import SR14528
import ArgumentParser

extension BugTool {
    
    struct ValueWithReferenceTypesInitialization: ParsableCommand {
        
        static let configuration = CommandConfiguration(abstract: "Measure the performance of value types with references initialization.")
        
        @Option(default: 1_000_000, help: "Number of times to execute the test code.")
        var iterations: UInt
        
        func run() throws {
            type(of: self).run(iterations: iterations)
        }
    }
}

extension BugTool.ValueWithReferenceTypesInitialization {
    
    @_silgen_name("swift_test_value_with_reference_types_initialization")
    static func run(iterations: UInt) {
        measure {
            for _ in 0 ..< iterations {
                // create and release
                var object: FooValue?
                object = FooValue(name: "Test")
                _ = object // silence warning, prevent optimization
                object = nil
            }
        }
    }
}

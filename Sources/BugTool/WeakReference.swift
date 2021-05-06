//
//  WeakReference.swift
//  
//
//  Created by Alsey Coleman Miller on 6/05/21.
//

import Foundation
import SR14528
import ArgumentParser

extension BugTool {
    
    struct WeakReference: ParsableCommand {
        
        static let configuration = CommandConfiguration(abstract: "Measure the performance of accessing weak references.")
        
        @Option(default: 1_000_000, help: "Number of times to execute the test code.")
        var iterations: UInt
        
        func run() throws {
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
}

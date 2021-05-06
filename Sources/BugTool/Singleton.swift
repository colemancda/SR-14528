//
//  Singleton.swift
//  
//
//  Created by Alsey Coleman Miller on 6/05/21.
//

import Foundation
import SR14528
import ArgumentParser

extension BugTool {
    
    struct Singleton: ParsableCommand {
        
        static let configuration = CommandConfiguration(abstract: "Measure the performance of accessing singletons.")
        
        @Option(default: 1_000_000, help: "Number of times to execute the test code.")
        var iterations: UInt
        
        func run() throws {
            measure {
                for _ in 0 ..< 1_000_000 {
                    // access and release
                    var object: FooObject?
                    object = TestFoo.shared
                    _ = object // silence warning, prevent optimization
                    object = nil
                }
            }
        }
    }
}

extension BugTool.Singleton {
    
    class TestFoo {
        
        static let shared = FooObject(name: "Test")
    }
}

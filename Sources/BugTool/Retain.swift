//
//  Retain.swift
//  
//
//  Created by Alsey Coleman Miller on 6/05/21.
//

import Foundation
import SR14528
import ArgumentParser

extension BugTool {
    
    struct Retain: ParsableCommand {
        
        static let configuration = CommandConfiguration(abstract: "Measure the performance of retaining objects")
        
        @Option(default: 1_000_000, help: "Number of times to execute the test code.")
        var iterations: UInt
        
        func run() throws {
            type(of: self).run(iterations: iterations)
        }
    }
}

extension BugTool.Retain {
    
    @_silgen_name("swift_test_retain")
    static func run(iterations: UInt) {
        let count = Int(iterations)
        var array = [FooObject]()
        array.reserveCapacity(count)
        measure {
            for _ in 0 ..< count {
                // create and retain
                let object = FooObject(name: "Test")
                array.append(object)
            }
        }
    }
}

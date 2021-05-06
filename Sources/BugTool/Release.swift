//
//  Release.swift
//  
//
//  Created by Alsey Coleman Miller on 6/05/21.
//

import Foundation
import SR14528
import ArgumentParser

extension BugTool {
    
    struct Release: ParsableCommand {
        
        static let configuration = CommandConfiguration(abstract: "Measure the performance of releasing objects")
        
        @Option(default: 1_000_000, help: "Number of times to execute the test code.")
        var iterations: UInt
        
        func run() throws {
            let count = Int(iterations)
            var array = [FooObject]()
            array.reserveCapacity(count)
            for _ in 0 ..< count {
                // create and retain
                let object = FooObject(name: "Test")
                array.append(object)
            }
            measure {
                // release all objects
                array.removeAll(keepingCapacity: true)
            }
        }
    }
}

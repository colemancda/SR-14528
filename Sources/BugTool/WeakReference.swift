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
            type(of: self).run(iterations: iterations)
        }
    }
}

extension BugTool.WeakReference {
    
    @_silgen_name("swift_test_weak_reference")
    static func run(iterations: UInt) {
        let parent = PersonObject(name: "Parent")
        for _ in 0 ..< iterations {
            let child = PersonObject(name: "Child")
            parent.add(child: child)
        }
        measure {
            for child in parent.children {
                _ = child.parent
            }
        }
    }
}

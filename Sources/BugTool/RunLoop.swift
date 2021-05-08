//
//  RunLoop.swift
//  
//
//  Created by Alsey Coleman Miller on 7/05/21.
//

import Foundation
import SR14528
import ArgumentParser

extension BugTool {
    
    struct RunLoop: ParsableCommand {
        
        static let configuration = CommandConfiguration(abstract: "Measure the performance of accessing weak references.")
        
        @Option(default: 1_000_000, help: "Number of times to execute the test code.")
        var iterations: UInt
        
        func run() throws {
            typealias RunLoop = Foundation.RunLoop
            let foo = FooObject(name: "Test")
            let timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
                foo.printDate()
            }
            RunLoop.current.run()
        }
    }
}

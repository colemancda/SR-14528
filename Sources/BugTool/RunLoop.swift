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
        
        static let configuration = CommandConfiguration(abstract: "Measure the performance of running a run loop with a timer.")
        
        func run() throws {
            let foo = FooObject(name: "Test")
            let timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
                foo.printDate()
            }
            Foundation.RunLoop.current.run()
        }
    }
}

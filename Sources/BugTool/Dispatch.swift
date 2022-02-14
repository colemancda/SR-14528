//
//  Dispatch.swift
//  
//
//  Created by Alsey Coleman Miller on 7/05/21.
//

import Foundation
import Dispatch
import SR14528
import ArgumentParser

extension BugTool {
    
    struct Dispatch: ParsableCommand {
        
        static let configuration = CommandConfiguration(abstract: "Measure the performance of running a GCD queue.")
        
        func run() throws {
            let foo = FooObject(name: "Test")
            DispatchQueue.global(qos: .userInteractive).async {
                repeat {
                    foo.printDate()
                    Thread.sleep(forTimeInterval: 1.0)
                } while true
            }
            Foundation.RunLoop.current.run(until: Date() + 5)
        }
    }
}

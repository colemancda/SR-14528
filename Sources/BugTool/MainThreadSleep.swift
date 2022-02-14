//
//  MainThreadSleep.swift
//
//
//  Created by JurjDev on 26/05/21.
//

import Foundation
import SR14528
import ArgumentParser

extension BugTool {
    
    struct MainThreadSleep: ParsableCommand {
        
        static let configuration = CommandConfiguration(abstract: "Main thread sleep.")
        
        func run() throws {
            let endDate = Date() + 5
            let foo = FooObject(name: "Test")
            repeat {
                foo.printDate()
                Thread.sleep(forTimeInterval: 1.0)
            } while Date() < endDate
        }
    }
}


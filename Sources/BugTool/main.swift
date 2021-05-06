import Foundation
import Dispatch
import SR14528
import ArgumentParser

struct BugTool: ParsableCommand {
        
    static let configuration = CommandConfiguration(
        abstract: "Test tool for Swift performance.",
        version: "1.0.0",
        subcommands: [
            ObjectInitialization.self,
            ValueWithReferenceTypesInitialization.self,
            Singleton.self,
            Retain.self,
            Release.self,
            ProtocolWitnessTable.self,
            WeakReference.self
        ]
    )
}

// manually run all tests without parsing arguments
if CommandLine.arguments.count < 2 {
    let iterations: UInt = 1_000_000
    print("Object Initialization")
    BugTool.ObjectInitialization.run(iterations: iterations)
    print("Value with Reference Types Initialization")
    BugTool.ValueWithReferenceTypesInitialization.run(iterations: iterations)
    print("Singleton")
    BugTool.Singleton.run(iterations: iterations)
    print("Retain")
    BugTool.Retain.run(iterations: iterations)
    print("Release")
    BugTool.Release.run(iterations: iterations)
    print("Protocol Witness Table")
    BugTool.ProtocolWitnessTable.run(iterations: iterations)
    print("Weak Reference")
    BugTool.WeakReference.run(iterations: iterations)
} else {
    BugTool.main()
}

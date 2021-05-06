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
            ProtocolWitnessTable.self
        ]
    )
}

BugTool.main()

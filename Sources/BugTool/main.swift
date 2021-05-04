import Foundation
import Dispatch
import SR14528

func run() throws {
    print("Hello, world!")
    for index in 0 ..< 10 {
        let object = Foo(name: "Thing \(index + 1)")
        object.printName()
        object.printDate()
        Thread.sleep(forTimeInterval: 1.0)
    }
}

do {
    try run()
} catch {
    print("Error: \(error)")
}

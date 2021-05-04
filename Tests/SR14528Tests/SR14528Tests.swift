import Foundation
import XCTest
@testable import SR14528

final class SR14528Tests: XCTestCase {
        
    func testPerformanceInitialization() throws {
        
        measure {
            for _ in 0 ..< 1_000_000 {
                // create and release
                var object: Foo?
                object = Foo(name: "Test")
                _ = object // silence warning, prevent optimization
                object = nil
            }
        }
    }
    
    func testPerformanceSingleton() throws {
        
        measure {
            for _ in 0 ..< 1_000_000 {
                // create and release
                var object: DateFormatter?
                object = Foo.dateFormatter
                _ = object // silence warning, prevent optimization
                object = nil
            }
        }
    }
    
    func testPerformanceRetain() throws {
        
        let count = 1_000_000
        var array = [Foo]()
        array.reserveCapacity(count)
        measure {
            for _ in 0 ..< count {
                // create and retain
                let object = Foo(name: "Test")
                array.append(object)
            }
        }
    }
    
    func testPerformanceRelease() throws {
        
        let count = 1_000_000
        var array = [Foo]()
        array.reserveCapacity(count)
        for _ in 0 ..< count {
            // create and retain
            let object = Foo(name: "Test")
            array.append(object)
        }
        measure {
            // release all objects
            array.removeAll(keepingCapacity: true)
        }
        XCTAssert(array.isEmpty)
    }
}

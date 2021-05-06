import Foundation
import XCTest
@testable import SR14528

final class SR14528Tests: XCTestCase {
        
    func testPerformanceObjectInitialization() throws {
        
        measure {
            for _ in 0 ..< 1_000_000 {
                // create and release
                var object: FooObject?
                object = FooObject(name: "Test")
                _ = object // silence warning, prevent optimization
                object = nil
            }
        }
    }
    
    func testPerformanceValueWithReferenceTypesInitialization() throws {
        
        measure {
            for _ in 0 ..< 1_000_000 {
                // create and release
                var object: FooValue?
                object = FooValue(name: "Test")
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
                object = FooObject.dateFormatter
                _ = object // silence warning, prevent optimization
                object = nil
            }
        }
    }
    
    func testPerformanceRetain() throws {
        
        let count = 1_000_000
        var array = [FooObject]()
        array.reserveCapacity(count)
        measure {
            for _ in 0 ..< count {
                // create and retain
                let object = FooObject(name: "Test")
                array.append(object)
            }
        }
    }
    
    func testPerformanceRelease() throws {
        
        let count = 1_000_000
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
        XCTAssert(array.isEmpty)
    }
    
    func testPerformanceProtocol() throws {
        
        let count = 1_000_000
        var array = [NameProtocol]()
        array.reserveCapacity(count)
        for index in 0 ..< count {
            // create and retain
            if index % 2 == 0 {
                let value = FooValue(name: "Test")
                array.append(value)
            } else {
                let object = FooObject(name: "Test")
                array.append(object)
            }
        }
        measure {
            for value in array {
                let _ = value.name
            }
            
        }
    }
    
    func testPerformanceWeakReferences() throws {
        
        let count = 1_000_000
        let parent = PersonObject(name: "Parent")
        for _ in 0 ..< count {
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

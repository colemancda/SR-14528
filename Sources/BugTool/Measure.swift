//
//  Measure.swift
//  
//
//  Created by Alsey Coleman Miller on 6/05/21.
//

import Foundation

@inline(__always)
func measure(_ block: () -> ()) {
    let start = Date()
    block()
    let end = Date()
    let time = end.timeIntervalSince(start)
    print("\(String(format: "%.4f", time))s")
}

# SR-14528
Demo project for Swift bug [SR-14528](https://bugs.swift.org/browse/SR-14528).

This project demonstrates the performance penality when using the Swift 5.3 runtime cross-compiled for Linux on Armv7 compared to the Swift 5.1 runtime provided by [buildSwiftOnARM](https://github.com/uraimo/buildSwiftOnARM). All code is compiled in release configuration and run on a Raspberry Pi 3B+ with 1GB of RAM.

## Dispatch
Using `DispatchQueue` to print the date every second on a background thread and then sleep.

`$ swift-bug-test dispatch`

| Swift | CPU Sleeping | CPU Wakeup | Memory Usage |
|-------|--------------|------------|--------------|
| 5.1   | 0.3%         | 0.3%       | 1.8%         |
| 5.3   | 5.3%         | 8.3%       | 1.8%         |

## RunLoop
Using `Foundation.RunLoop` to print the date every second on the main thread and then sleep.

`$ swift-bug-test run-loop`

| Swift | CPU Sleeping | CPU Wakeup | Memory Usage |
|-------|--------------|------------|--------------|
| 5.1   | 0.3%         | 0.7%       | 1.9%         |
| 5.3   | 7.6%         | 8.9%       | 2.0%         |


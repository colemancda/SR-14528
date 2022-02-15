# SR-14528
Demo project for Swift bug [SR-14528](https://bugs.swift.org/browse/SR-14528).

This project demonstrates the performance penality when using the Swift 5.5 runtime cross-compiled for Linux on Armv7 for Buildroot vs Yocto.


## RunLoop
Using `Foundation.RunLoop` to print the date every second on the main thread and then sleep.

`$ swift-bug-test run-loop`

| Swift | Linux 			| CPU Load   | Real-Time | User      | System    |
|-------|--------------|------------|-----------|-----------|------------
| 5.5   | Buildroot 	| 0.7%       | 0m5.082s  | 0m0.050s  | 0m0.040s  |
| 5.5   | Yocto			| 98.3%      | 0m11.466s | 0m6.550s  | 0m0.020s  |

## Dispatch
Using `DispatchQueue` to print the date every second on a background thread and then sleep.

`$ swift-bug-test dispatch`

| Swift | Linux 			| CPU Load   | Real-Time | User      | System    |
|-------|--------------|------------|-----------|-----------|------------
| 5.5   | Buildroot 	| 0.7%       | 0m5.080s  | 0m0.070s  | 0m0.030s  |
| 5.5   | Yocto			| 97.1%      | 0m11.802s | 0m6.870s  | 0m0.010s  |

## Sleep
Using a simple `while` loop to print the date every second on the main thread and then sleep.

`$ swift-bug-test main-thread-sleep`

| Swift | Linux 			| CPU Load   | Real-Time | User      | System    |
|-------|--------------|------------|-----------|-----------|------------
| 5.5   | Buildroot 	| 0.7%       | 0m5.098s  | 0m0.080s  | 0m0.010s  |
| 5.5   | Yocto			| 97.7%      | 0m12.980s | 0m7.570s  | 0m0.040s  |

## Object Initialization
Allocating an object 10,000 times.

`$ swift-bug-test object-initialization --iterations 10000`

| Swift | Linux 			| CPU Load   | Real-Time | User      | System    |
|-------|--------------|------------|-----------|-----------|------------
| 5.5   | Buildroot 	| 0.3%       | 0m0.083s  | 0m0.030s  | 0m0.040s  |
| 5.5   | Yocto			| 97.4%      | 0m14.626s | 0m14.170s | 0m0.010s  |



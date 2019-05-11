//
//  BigNum.swift
//  KitaMath
//
//  Created by AIA-Chris on 11/05/19.
//  Copyright © 2019 Chrizers. All rights reserved.
//

import Foundation

struct BigNum: CustomStringConvertible {
    var arr = [Int]()
    
    // Return BigNum value as a String so it can be printed
    var description: String { return arr.map(String.init).joined() }
    
    init(_ arr: [Int]) {
        self.arr = carryAll(arr)
    }
    
    // Allow BigNum to be initialized with an `Int`
    init(_ i: Int = 0) {
        self.init([i])
    }
    
    // Perform the carry operation to restore the array to single
    // digits
    func carryAll(_ arr: [Int]) -> [Int] {
        var result = [Int]()
        
        var carry = 0
        for val in arr.reversed() {
            let total = val + carry
            let digit = total % 10
            carry = total / 10
            result.append(digit)
        }
        
        while carry > 0 {
            let digit = carry % 10
            carry = carry / 10
            result.append(digit)
        }
        
        return result.reversed()
    }
    
    // Enable two BigNums to be added with +
    static func +(_ lhs: BigNum, _ rhs: BigNum) -> BigNum {
        var arr1 = lhs.arr
        var arr2 = rhs.arr
        
        let diff = arr1.count - arr2.count
        
        // Pad the arrays to the same length
        if diff < 0 {
            arr1 = Array(repeating: 0, count: -diff) + arr1
        } else if diff > 0 {
            arr2 = Array(repeating: 0, count: diff) + arr2
        }
        
        return BigNum(zip(arr1, arr2).map { $0 + $1 })
    }
}

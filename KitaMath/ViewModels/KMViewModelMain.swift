//
//  KMViewModelMain.swift
//  KitaMath
//
//  Created by AIA-Chris on 08/05/19.
//  Copyright © 2019 Chrizers. All rights reserved.
//

import Foundation
class KMViewModelMain {
    
    internal func findFibonacci(n:Int) -> [BigNum] {
        guard n >= 2 else { return [BigNum()] }
        var array = [BigNum(0), BigNum(1)]
        for i in 2...n-1{
            array.append(BigNum())
            array[i] = array[i - 1] + array[i - 2]
        }
        return array
    }
    
    internal func findPrime(n:Int) -> [Int] {
        var primes = [Int]()
        for i in 0...n-1 {
            primes.append(exPrimes()[i])
        }
        return primes
    }
    
    internal func sum(p0:Int, p1:Int) -> Int {
        return p0 + p1
    }
    
    internal func multiply(p0:Int, p1:Int) -> Int {
        return p0 * p1
    }
    
    fileprivate func exPrimes() -> [Int] {
        let maxP = 1000
        var isPrime: [Bool] = []
        var primes: [Int] = []
        for _ in 0...maxP {
            isPrime.append(true)
        }
        isPrime[0] = false
        isPrime[1] = false
        for i in 2...maxP {
            if isPrime[i] == true {
                var j = i*i
                while j <= maxP {
                    isPrime[j] = false
                    j += i
                }
                primes.append(i)
            }
        }
        return primes
    }
}

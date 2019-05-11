//
//  Content.swift
//  KitaMath
//
//  Created by AIA-Chris on 08/05/19.
//  Copyright © 2019 Chrizers. All rights reserved.
//

import Foundation

struct Content {
    let title:String
    let description:String
    
    init(title:String, description:String) {
        self.title = title
        self.description = description
    }
    
    static let contents = [
        Content(title: "SUM", description: "The aggregate of two or more numbers, magnitudes, quantities, or particulars as determined by or as if by the mathematical process of addition: The sum of 6 and 8 is 14."),
        Content(title: "MULTIPLY", description: "A mathematical operation performed on a pair of numbers in order to derive a third number called a product. For positive integers, multiplication consists of adding a number (the multiplicand) to itself a specified number of times. Thus multiplying 6 by 3 means adding 6 to itself three times."),
        Content(title: "PRIME", description: "A prime number is a whole number greater than 1 whose only factors are 1 and itself. A factor is a whole numbers that can be divided evenly into another number. The first few prime numbers are 2, 3, 5, 7, 11, 13, 17, 19, 23 and 29. Numbers that have more than two factors are called composite numbers."),
        Content(title: "Fibonacci", description: "The Fibonacci sequence is a set of numbers that starts with a one or a zero, followed by a one, and proceeds based on the rule that each number (called a Fibonacci number) is equal to the sum of the preceding two numbers. ... F (0) = 0, 1, 1, 2, 3, 5, 8, 13, 21, 34 ...")
    ]
}

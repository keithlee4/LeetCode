//
//  MaxConsecutiveOnes.swift
//  LeetCode
//
//  Created by Keith Lee on 2018/1/20.
//  Copyright © 2018年 Keith Lee. All rights reserved.
//

import Foundation
/*
485. Max Consecutive Ones
Given a binary array, find the maximum number of consecutive 1s in this array.

Example 1:
Input: [1,1,0,1,1,1]
Output: 3
Explanation: The first two digits or the last three digits are consecutive 1s.
The maximum number of consecutive 1s is 3.
Note:

The input array will only contain 0 and 1.
The length of input array is a positive integer and will not exceed 10,000
 */

func findMaxConsecutiveOnes(_ nums: [Int]) -> Int {
    return nums.split(separator: 0).map { $0.count }.max() ?? 0
}

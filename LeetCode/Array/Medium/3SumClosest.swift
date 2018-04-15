//
//  3SumClosest.swift
//  LeetCode
//
//  Created by Keith Lee on 2018/4/15.
//  Copyright © 2018年 Keith Lee. All rights reserved.
//

import Foundation

//16. 3Sum Closest
//
//Given an array nums of n integers and an integer target, find three integers in nums such that the sum is closest to target. Return the sum of the three integers. You may assume that each input would have exactly one solution.
//
//Example:
//
//Given array nums = [-1, 2, 1, -4], and target = 1.
//
//The sum that is closest to the target is 2. (-1 + 2 + 1 = 2).
func threeSumClosest(_ nums: [Int], _ target: Int) -> Int {
    let sortedSums = nums.sorted()
    var resultInterval = Int.max
    for i in 0..<sortedSums.count - 2 {
        for j in (i+1)..<sortedSums.count - 1 {
            for k in stride(from: sortedSums.count - 1, to: j, by: -1) {
                let sum = sortedSums[i] + sortedSums[j] + sortedSums[k]
                let interval = sum - target
                if interval == 0 { return target }
                if abs(resultInterval) - abs(interval) > 0 {
                    resultInterval = interval
                }
            }
        }
    }
    return target + resultInterval
}

//
//  Minimum Size Subarray Sum.swift
//  LeetCode
//
//  Created by Keith on 2018/5/12.
//  Copyright © 2018年 Keith Lee. All rights reserved.
//

import Foundation
//209. Minimum Size Subarray Sum

//Given an array of n positive integers and a positive integer s, find the minimal length of a contiguous subarray of which the sum ≥ s. If there isn't one, return 0 instead.
//
//Example:
//
//Input: [2,3,1,2,4,3], s = 7
//Output: 2
//Explanation: the subarray [4,3] has the minimal length under the problem constraint.
//Follow up:
//If you have figured out the O(n) solution, try coding another solution of which the time complexity is O(n log n).
func minSubArrayLen(_ s: Int, _ nums: [Int]) -> Int {
    guard !nums.isEmpty else { return 0 }
    var start: Int = 0
    var minLength: Int = 0
    repeat {
        var end = start
        var sum = 0
        var length = -1
        while end < nums.count {
            sum += nums[end]
            if sum >= s {
                length = (end - start) + 1
                break
            }
            
            end += 1
        }
        
        start += 1
        
        guard length >= 0 else { continue }
        if minLength == 0 {
            minLength = length
        }else {
            minLength = min(minLength, length)
        }
        
        guard minLength != 1 else { return 1 }
    }while start < nums.count
    
    return minLength
}

func prefect_minSubArrayLen(_ s: Int, _ nums: [Int]) -> Int {
    if nums.count == 0 {
        return 0
    }
    
    var lo = 0
    var hi = 0
    var sum = nums[0]
    var minRange: Int?
    while true {
        if lo == nums.count - 1 {
            break
        }
        if sum >= s {
            if hi == lo {
                return 1
            }
            if minRange == nil || minRange! > hi - lo {
                minRange = hi - lo
            }
            
            //IMPORTANT: Use minus to directly get the min sum range possible of next lo.
            sum -= nums[lo]
            lo = lo + 1
            continue
        } else {
            if hi == nums.count - 1 {
                break
            }
            hi = hi + 1
            sum += nums[hi]
            continue
        }
    }
    
    if let ans = minRange {
        return ans + 1
    } else {
        return 0
    }
}

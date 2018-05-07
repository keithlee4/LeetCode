//
//  SummaryRanges.swift
//  LeetCode
//
//  Created by Keith on 2018/5/7.
//  Copyright © 2018年 Keith Lee. All rights reserved.
//

import Foundation
//228. Summary Ranges
//Given a sorted integer array without duplicates, return the summary of its ranges.
//
//Example 1:
//Input: [0,1,2,4,5,7]
//Output: ["0->2","4->5","7"]
//Example 2:
//Input: [0,2,3,4,6,8,9]
//Output: ["0","2->4","6","8->9"]

func summaryRanges(_ nums: [Int]) -> [String] {
    guard !nums.isEmpty else { return [] }
    guard nums.count > 1 else {
        return [String(nums[0])]
    }
    
    var results: [String] = []
    var _nums = nums
    var start = _nums.removeFirst()
    var end = start
    
    let append: (Int, Int) -> Void = {
        start, end in
        if start == end {
            results.append(String(start))
        }else {
            results.append("\(start)->\(end)")
        }
    }
    
    
    while !_nums.isEmpty {
        let next = _nums.removeFirst()
        if next - end > 1 {
            append(start, end)
            
            start = next
            end = start
        }else {
            end = next
        }
    }
    
    append(start, end)
    
    return results
}

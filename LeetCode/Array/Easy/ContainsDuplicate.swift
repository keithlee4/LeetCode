//
//  ContainsDuplicate.swift
//  LeetCode
//
//  Created by Keith Lee on 2018/1/22.
//  Copyright © 2018年 Keith Lee. All rights reserved.
//

import Foundation

/*
 217. Contains Duplicate
 Given an array of integers, find if the array contains any duplicates. Your function should return true if any value appears at least twice in the array, and it should return false if every element is distinct.
 */

func containsDuplicate(_ nums: [Int]) -> Bool {
    guard nums.count > 1 else { return false }
    let sortedNums = nums.sorted(by: <)
    var prev: Int = sortedNums[0]
    
    for (idx, num) in sortedNums.enumerated() {
        if idx == 0 {
            continue
        }else {
            if prev == num { return true }
            else { prev = num }
        }
    }
    
    return false
}

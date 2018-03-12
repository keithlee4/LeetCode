//
//  RemoveDuplicatesFromSortedArray.swift
//  LeetCode
//
//  Created by Keith Lee on 2018/3/10.
//  Copyright © 2018年 Keith Lee. All rights reserved.
//

import Foundation

// 26. Remove Duplicates from Sorted Array
// Given a sorted array, remove the duplicates in-place such that each element appear only once and return the new length.
// Do not allocate extra space for another array, you must do this by modifying the input array in-place with O(1) extra memory.
// Example:

// Given nums = [1,1,2],

// Your function should return length = 2, with the first two elements of nums being 1 and 2 respectively.
// It doesn't matter what you leave beyond the new length.

func removeDuplicates(_ nums: inout [Int]) -> Int {
    var i = 0
    while i < nums.count - 1 {
        let current = nums[i]
        let next = nums[i + 1]
        if current == next {
            let _ = nums.remove(at: i + 1)
        }else {
            i += 1
        }
    }
    
    return nums.count
}

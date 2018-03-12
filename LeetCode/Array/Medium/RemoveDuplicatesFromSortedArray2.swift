//
//  RemoveDuplicatesFromSortedArray2.swift
//  LeetCode
//
//  Created by Keith Lee on 2018/3/10.
//  Copyright © 2018年 Keith Lee. All rights reserved.
//

import Foundation

//80. Remove Duplicates from Sorted Array II

//Follow up for "Remove Duplicates":
//What if duplicates are allowed at most twice?
//
//For example,
//Given sorted array nums = [1,1,1,2,2,3],
//
//Your function should return length = 5, with the first five elements of nums being 1, 1, 2, 2 and 3. It doesn't matter what you leave beyond the new length.

func removeDuplicates2(_ nums: inout [Int]) -> Int {
    var i = 0
    while i < nums.count - 2 {
        let current = nums[i]
        let next = nums[i + 1]
        let third = nums[i + 2]
        if current == next, next == third {
            let _ = nums.remove(at: i + 2)
        }else {
            i += 1
        }
    }
    
    return nums.count
}

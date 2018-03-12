//
//  RemoveElement.swift
//  LeetCode
//
//  Created by Keith Lee on 2018/3/10.
//  Copyright © 2018年 Keith Lee. All rights reserved.
//

import Foundation

//27. Remove Element

//Given an array and a value, remove all instances of that value in-place and return the new length.
//
//Do not allocate extra space for another array, you must do this by modifying the input array in-place with O(1) extra memory.
//
//The order of elements can be changed. It doesn't matter what you leave beyond the new length.
//
//Example:
//
//Given nums = [3,2,2,3], val = 3,
//
//Your function should return length = 2, with the first two elements of nums being 2.


func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
    var i = 0
    while i < nums.count {
        if nums[i] == val {
            nums.remove(at: i)
        }else {
            i += 1
        }
    }
    
    return nums.count
}

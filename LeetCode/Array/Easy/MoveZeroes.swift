//
//  MoveZeros.swift
//  LeetCode
//
//  Created by Keith Lee on 2018/3/10.
//  Copyright © 2018年 Keith Lee. All rights reserved.
//

import Foundation
//283. Move Zeroes

//Given an array nums, write a function to move all 0's to the end of it while maintaining the relative order of the non-zero elements.
//
//For example, given nums = [0, 1, 0, 3, 12], after calling your function, nums should be [1, 3, 12, 0, 0].
//
//Note:
//1. You must do this in-place without making a copy of the array.
//2. Minimize the total number of operations.

func moveZeroes(_ nums: inout [Int]) {
    var i = 0
    var zeroCount: Int = 0
    while i < nums.count {
        if nums[i] == 0, i < nums.count - zeroCount {
            nums.remove(at: i)
            nums.append(0)
            zeroCount += 1
        }else {
            i += 1
        }
    }
}

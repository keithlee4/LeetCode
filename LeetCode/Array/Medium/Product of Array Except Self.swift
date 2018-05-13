//
//  Product of Array Except Self.swift
//  LeetCode
//
//  Created by Keith on 2018/5/13.
//  Copyright © 2018年 Keith Lee. All rights reserved.
//

import Foundation
//238. Product of Array Except Self
//Given an array nums of n integers where n > 1,  return an array output such that output[i] is equal to the product of all the elements of nums except nums[i].
//
//Example:
//
//Input:  [1,2,3,4]
//Output: [24,12,8,6]
//Note: Please solve it without division and in O(n).
//
//Follow up:
//Could you solve it with constant space complexity? (The output array does not count as extra space for the purpose of space complexity analysis.)

//Note: 記得多次使用O(n)也是O(n)喔，使用正向跟反向的乘積便可達成目的
func productExceptSelf(_ nums: [Int]) -> [Int] {
    var products = Array<Int>.init(repeating: 1, count: nums.count)
    var prefix: Int = 1
    for i in 0..<nums.count {
        products[i] *= prefix
        prefix *= nums[i]
    }
    
    var suffix: Int = 1
    for j in stride(from: nums.count - 1, through: 0, by: -1) {
        products[j] *= suffix
        suffix *= nums[j]
    }
    
    return products
}

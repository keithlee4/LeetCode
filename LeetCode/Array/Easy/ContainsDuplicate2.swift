//
//  ContainsDuplicate2.swift
//  LeetCode
//
//  Created by Keith Lee on 2018/3/10.
//  Copyright © 2018年 Keith Lee. All rights reserved.
//

import Foundation

// 219. Contains Duplicate II
// Given an array of integers and an integer k, find out whether there are two distinct indices i and j in the array such that nums[i] = nums[j] and the absolute difference between i and j is at most k.
func containsNearbyDuplicate(_ nums: [Int], _ k: Int) -> Bool {
    var indices: [Int : Int] = [:]
    for i in 0..<nums.count {
        if let origin = indices[nums[i]], abs(origin - i) <= k {
            return true
        }
        
         indices[nums[i]] = i
    }
    
    return false
}

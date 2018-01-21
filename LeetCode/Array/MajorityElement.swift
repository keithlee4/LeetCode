//
//  MajorityElement.swift
//  LeetCode
//
//  Created by Keith Lee on 2018/1/20.
//  Copyright © 2018年 Keith Lee. All rights reserved.
//

import Foundation
/*
169. Majority Element
 
Given an array of size n, find the majority element. The majority element is the element that appears more than ⌊ n/2 ⌋ times.

You may assume that the array is non-empty and the majority element always exist in the array.

Credits:
Special thanks to @ts for adding this problem and creating all test cases.
*/

func majorityElement(_ nums: [Int]) -> Int {
    var max: Int = 0
    let map = nums.reduce([:], { (map, num) -> [Int : Int] in
        var newMap = map
        if let count = newMap[num] {
            newMap[num] = count + 1
        }else {
            newMap[num] = 1
        }
        
        return newMap
    })
    
    var maxValue = 0
    for (key, value) in map {
        if value > maxValue {
            max = key
            maxValue = value
        }
    }
    
    return max
}

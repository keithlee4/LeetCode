//
//  MajorityElement2.swift
//  LeetCode
//
//  Created by Keith Lee on 2018/1/21.
//  Copyright © 2018年 Keith Lee. All rights reserved.
//

import Foundation
/*
 229. Majority Element II
 Given an integer array of size n, find all elements that appear more than ⌊ n/3 ⌋ times. The algorithm should run in linear time and in O(1) space.
 */

func majorityElement2(_ nums: [Int]) -> [Int] {
    guard nums.count > 0 else { return [] }
    var matchResult: [Int] = []
    let totalCount = nums.count
    
    let sortedNums = nums.sorted { $0 < $1 }
    var curNum: Int = sortedNums[0]
    var prevNumCount: Int = 0
    var curNumCount: Int = 0
    for (idx, n) in sortedNums.enumerated() {
        if n == curNum {
            curNumCount += 1
        }else {
            //move to new integer
            prevNumCount = curNumCount
            curNumCount = 1
        }
        
        //If find new number or reach end of array
        //This is for compare prev number
        if curNum != n  {
            if prevNumCount * 3 > totalCount {
                matchResult.append(curNum)
            }
        }
        
        //if enter end of array, check the current number
        if idx == totalCount - 1 {
            if curNumCount * 3 > totalCount {
                matchResult.append(n)
            }
        }
        
        curNum = n
    }
    
    return matchResult
}

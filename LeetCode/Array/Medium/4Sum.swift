//
//  4Sum.swift
//  LeetCode
//
//  Created by Keith Lee on 2018/4/15.
//  Copyright © 2018年 Keith Lee. All rights reserved.
//

import Foundation
//18. 4Sum
//Given an array nums of n integers and an integer target, are there elements a, b, c, and d in nums such that a + b + c + d = target? Find all unique quadruplets in the array which gives the sum of target.
//
//Note:
//
//The solution set must not contain duplicate quadruplets.
//
//Example:
//
//Given array nums = [1, 0, -1, 0, -2, 2], and target = 0.
//
//A solution set is:
//[
//[-1,  0, 0, 1],
//[-2, -1, 1, 2],
//[-2,  0, 0, 2]
//]

//This cost 450 ms
func fourSum(_ nums: [Int], _ target: Int) -> [[Int]] {
    guard nums.count >= 4 else { return [] }
    let sortedNums = nums.sorted()
    var result: [[Int]] = []
    for i in 0..<sortedNums.count - 3 {
        if i > 0 && sortedNums[i] == sortedNums[i - 1] { continue }
        for j in i+1..<sortedNums.count - 2 {
            if j > i+1 && sortedNums[j] == sortedNums[j - 1] { continue }
            var k = j + 1
            var l = sortedNums.count - 1
            let prevTwoSum = sortedNums[i] + sortedNums[j]
            while k < l {
                if k > j + 1 && sortedNums[k] == sortedNums[k - 1] {
                    k += 1
                    continue
                }
                
                if l < sortedNums.count - 1 && sortedNums[l] == sortedNums[l + 1] {
                    l -= 1
                    continue
                }
                
                let sum_kl = sortedNums[k] + sortedNums[j]
                if sum_kl + prevTwoSum == target {
                    result.append([sortedNums[i], sortedNums[j], sortedNums[k], sortedNums[l]])
                    k += 1
                    l -= 1
                }else if sum_kl + prevTwoSum < target {
                    k += 1
                }else if sum_kl + prevTwoSum > target {
                    l -= 1
                }
            }
        }
    }
    
    return result
}

//This is the best pattern, cost only 88 ms
class FourSumSuggest {
    func fourSum(_ nums: [Int], _ target: Int) -> [[Int]] {
        guard nums.count > 3 else {
            return [[Int]]()
        }
        
        var result = [[Int]]()
        let sortedNums = nums.sorted()
        for i in 0...sortedNums.count-4 {
            if i == 0 || sortedNums[i] != sortedNums[i-1] {
                let subResult = threeSum(sortedNums, i+1, target-sortedNums[i])
                
                for subResultItem in subResult {
                    var r = subResultItem
                    r.append(sortedNums[i])
                    result.append(r)
                }
            }
        }
        
        return result
    }
    
    func threeSum(_ nums: [Int], _ startIndex: Int, _ k: Int) -> [[Int]] {
        guard nums.count-startIndex > 2 else {
            return [[Int]]()
        }
        
        let sortedNums = nums // nums.sorted()
        var result = [[Int]]()
        
        for i in startIndex...sortedNums.count-3 {
            if i == startIndex || sortedNums[i] != sortedNums[i-1] {
                var start = i+1
                var end = sortedNums.count-1
                let target = k-sortedNums[i]
                
                while start < end {
                    let sum = sortedNums[start] + sortedNums[end]
                    
                    if sum == target {
                        result.append([sortedNums[i], sortedNums[start], sortedNums[end]])
                        while start < end && sortedNums[start] == sortedNums[start+1] {
                            start += 1
                        }
                        while start < end && sortedNums[end] == sortedNums[end-1] {
                            end -= 1
                        }
                        
                        start += 1
                        end -= 1
                    } else if sum > target {
                        end -= 1
                    } else {
                        start += 1
                    }
                }
            }
        }
        
        return result
    }
}

//
//  3Sum.swift
//  LeetCode
//
//  Created by Keith Lee on 2018/3/10.
//  Copyright © 2018年 Keith Lee. All rights reserved.
//

import Foundation
// 15. 3Sum
//Given an array S of n integers, are there elements a, b, c in S such that a + b + c = 0? Find all unique triplets in the array which gives the sum of zero.
//
//Note: The solution set must not contain duplicate triplets.
//
//For example, given array S = [-1, 0, 1, 2, -1, -4],
//
//A solution set is:
//[
//  [-1, 0, 1],
//  [-1, -1, 2]
//]


//Failed Not Efficient Enough
func threeSum(_ nums: [Int]) -> [[Int]] {
    guard nums.count >= 3 else { return [] }
    var map: [Int: [Int : Int]] = [:]
    
    for i in 0..<nums.count-2 {
        let a = nums[i]
        for j in (i+1)..<nums.count-1 {
            let b = nums[j]
            for k in (j+1)..<nums.count {
                let c = nums[k]
                if a + b + c == 0 {
                    if let aMap = map[a] {
                        var newMap = aMap
                        newMap[b] = c
                        
                        map[a] = newMap
                    }else {
                        map[a] = [b:c]
                    }
                }
            }
        }
    }
    
    return map.reduce([], { (result, arg1) -> [[Int]] in
        let (key, bcMap) = arg1
        let res = bcMap.map { [key, $0, $1] }
        
        var validResults = [[Int]]()
        for r in res {
            var hasSameElement: Bool = false
            for originRes in result + validResults {
                let sort_r = r.sorted(by: <)
                let sortRes = originRes.sorted(by: <)
                if sort_r[0] == sortRes[0] && sort_r[1] == sortRes[1] {
                    hasSameElement = true
                }
            }
            
            if !hasSameElement { validResults.append(r.sorted(by: <)) }
        }
        
        return result + validResults
    })
}


//Note: 任何需要匹配不重複結果的運算，都可以用頭尾為index向中間集合的while解決（類似Quick sort)
func suggest_threeSum(_ nums: [Int]) -> [[Int]] {
    guard nums.count > 2 else { return [] }
    
    let sortedNums = nums.sorted(by: <)
    var res = [[Int]]()
    for i in 0..<sortedNums.count - 2 {
        if i > 0 && sortedNums[i] == sortedNums[i - 1] { continue } //skip same result
        
        var j = i + 1
        var k = sortedNums.count - 1
        let target = -sortedNums[i]
        
        while j < k {
            if sortedNums[j] + sortedNums[k] == target {
                res.append([sortedNums[i], sortedNums[j], sortedNums[k]])
                
                j += 1
                k -= 1
                
                while j < k && sortedNums[j] == sortedNums[j - 1] { j += 1 } //skip same result
                while j < k && sortedNums[k] == sortedNums[k + 1] { k -= 1 } //skip same result
            }else if sortedNums[j] + sortedNums[k] > target {
                k -= 1
            }else {
                j += 1
            }
        }
    }
    
    return res

}

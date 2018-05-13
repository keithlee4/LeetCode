//
//  Smallest Range.swift
//  LeetCode
//
//  Created by Keith on 2018/5/13.
//  Copyright © 2018年 Keith Lee. All rights reserved.
//

import Foundation

//632. Smallest Range
//You have k lists of sorted integers in ascending order. Find the smallest range that includes at least one number from each of the k lists.
//
//We define the range [a,b] is smaller than range [c,d] if b-a < d-c or a < c if b-a == d-c.
//
//Example 1:
//Input:[[4,10,15,24,26], [0,9,12,20], [5,18,22,30]]
//Output: [20,24]
//Explanation:
//List 1: [4, 10, 15, 24,26], 24 is in range [20,24].
//List 2: [0, 9, 12, 20], 20 is in range [20,24].
//List 3: [5, 18, 22, 30], 22 is in range [20,24].
//Note:
//The given list may contain duplicates, so ascending order means >= here.
//1 <= k <= 3500
//-105 <= value of elements <= 105.
//For Java users, please note that the input type has been changed to List<List<Integer>>. And after you reset the code template, you'll see this point.

//Desc: The idea is to make all the nums[] into single sorted sequence, defining a range with O(n^2) to determine if the origin sequnce has num inside each range. If all the origin sequences has element inside the range, then the range is accepeted.
func smallestRange(_ nums: [[Int]]) -> [Int] {
    let allNums = nums.flatMap { $0 }.sorted(by: <)
    guard !allNums.isEmpty else { return [] }
    var start: Int = 0
    var end = start
    
    var currentMatchedStart: Int = -1
    var currentMatchedEnd: Int = -1
    while start < allNums.count {
        if start > 0 && allNums[start] == allNums[start - 1] {
            start += 1
            end = start
            continue
        }
        
        let from = allNums[start]
        while end < allNums.count {
            if end > 0 && allNums[end] == allNums[end - 1] {
                end += 1
                continue
            }
            
            if currentMatchedEnd != -1 && currentMatchedStart != -1 {
                guard (allNums[end] - allNums[start]) < (allNums[currentMatchedEnd] - allNums[currentMatchedStart]) else {
                    end += 1
                    break
                }
            }
            
            let to = allNums[end]
            var isValidTo: Bool = true
            for numSet in nums {
                if !hasAnyNumInTheNumRange(source: numSet, from: from, to: to) {
                    isValidTo = false
                    break
                }
            }
            
            if isValidTo {
                currentMatchedStart = start
                currentMatchedEnd = end
            }
            
            end += 1
        }
        
        
        start += 1
        end = start
    }
    
    if currentMatchedStart != -1 && currentMatchedEnd != -1 {
        return [allNums[currentMatchedStart], allNums[currentMatchedEnd]]
    }else {
        return []
    }
}

func hasAnyNumInTheNumRange(source: [Int], from: Int, to: Int) -> Bool {
    for s in source {
        if from <= s && s <= to {
            return true
        }else if s > to {
            return false
        }
    }
    
    return false
}

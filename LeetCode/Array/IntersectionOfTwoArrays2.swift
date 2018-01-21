//
//  IntersectionOfTwoArrays2.swift
//  LeetCode
//
//  Created by Keith Lee on 2018/1/21.
//  Copyright © 2018年 Keith Lee. All rights reserved.
//

import Foundation
/*
 350. Intersection of Two Arrays II
 Given two arrays, write a function to compute their intersection.
 
 Example:
 Given nums1 = [1, 2, 2, 1], nums2 = [2, 2], return [2, 2].
 
 Note:
 Each element in the result should appear as many times as it shows in both arrays.
 The result can be in any order.
 Follow up:
 What if the given array is already sorted? How would you optimize your algorithm?
 What if nums1's size is small compared to nums2's size? Which algorithm is better?
 What if elements of nums2 are stored on disk, and the memory is limited such that you cannot load all elements into the memory at once?
 */

func intersect2(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
//    let sortedNums1 = nums1.sorted { $0 < $1 }
//    let sortedNums2 = nums2.sorted { $0 < $1 }
    
    let mapNums1 = nums1.reduce([:]) { (result, num) -> [Int : Int] in
        var newResult = result
        if let n = newResult[num] {
            newResult[num] = n + 1
        }else  {
            newResult[num] = 1
        }
        
        return newResult
    }
    
    let mapNums2 = nums2.reduce([:]) { (result, num) -> [Int : Int] in
        var newResult = result
        if let n = newResult[num] {
            newResult[num] = n + 1
        }else  {
            newResult[num] = 1
        }
        
        return newResult
    }
    
    var result: [Int] = []
    for (num, count) in mapNums1 {
        if let count2 = mapNums2[num] {
            result.append(contentsOf: (Array.init(repeating: num, count: min(count, count2))))
        }else {
            continue
        }
    }
    
    return result
}

//MARK: - Using while
func suggest_intersect2(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
    let sortedNums1 = nums1.sorted { $0 < $1 }
    let sortedNums2 = nums2.sorted { $0 < $1 }
    
    var i = 0, j = 0
    var res = [Int]()
    while i < sortedNums1.count && j < sortedNums2.count {
        if nums1[i] < nums2[j] {
            i += 1
        }else if sortedNums1[i] > sortedNums2[j] {
            j += 1
        }else {
            res.append(sortedNums1[i])
            i += 1
            j += 1
        }
    }
    
    return res
}

//
//  IntersectionOfTwoArrays.swift
//  LeetCode
//
//  Created by Keith Lee on 2018/1/21.
//  Copyright © 2018年 Keith Lee. All rights reserved.
//

import Foundation
/*
 349. Intersection of Two Arrays
 Given two arrays, write a function to compute their intersection.
 
 Example:
 Given nums1 = [1, 2, 2, 1], nums2 = [2, 2], return [2].
 
 Note:
 Each element in the result must be unique.
 The result can be in any order.
 */

func intersection(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
    return nums1.filter { nums2.contains($0) }
        .reduce([]) {
            (result, num) -> [Int] in
            if result.contains(num) {
                return result
            }
            else {
                return result + [num]
            }
        }
}

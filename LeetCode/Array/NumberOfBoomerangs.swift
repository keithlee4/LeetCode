//
//  NumberOfBoomerangs.swift
//  LeetCode
//
//  Created by Keith Lee on 2018/1/20.
//  Copyright © 2018年 Keith Lee. All rights reserved.
//

import Foundation

/*
 447. Number of Boomerangs
 Given n points in the plane that are all pairwise distinct, a "boomerang" is a tuple of points (i, j, k) such that the distance between i and j equals the distance between i and k (the order of the tuple matters).
 
 Find the number of boomerangs. You may assume that n will be at most 500 and coordinates of points are all in the range [-10000, 10000] (inclusive).
 
 Example:
 Input:
 [[0,0],[1,0],[2,0]]
 
 Output:
 2
 
 Explanation:
 The two boomerangs are [[1,0],[0,0],[2,0]] and [[1,0],[2,0],[0,0]]
 */
func numberOfBoomerangs(_ points: [[Int]]) -> Int {
    let distance : (_ p1: [Int], _ p2: [Int]) -> Int = { p1, p2 -> Int in
        let x = p1[0] - p2[0]
        let y = p1[1] - p2[1]
        
        return x*x + y*y
    }
    
    var totalNumber: Int = 0
    for (i, p1) in points.enumerated() {
        var distanceCount: [Int: Int] = [:]
        for (j, p2) in points.enumerated() {
            if i == j { continue }
            let dis = distance(p1, p2)
            if let originCount = distanceCount[dis] {
                distanceCount[dis] = originCount + 1
            }else {
                distanceCount[dis] = 1
            }
        }
        
        for value in distanceCount.values {
            totalNumber += (value * (value - 1))
        }
    }
    
    return totalNumber
    
//    var sameCount: Int = 0
//    let totalPoints = points.count
    
//    var firstIdx = 0
//    var secondIdx = firstIdx + 1
//    var thirdIdx = secondIdx + 1
//
//
//    while firstIdx < totalPoints - 2 {
//        while secondIdx < totalPoints - 1 {
//            while thirdIdx < totalPoints {
//                if isDistanceSame(points[firstIdx], points[secondIdx], points[thirdIdx]) {
//                    sameCount += 1
//                }
//
//                if isDistanceSame(points[secondIdx], points[firstIdx], points[thirdIdx]) {
//                    sameCount += 1
//                }
//
//                if isDistanceSame(points[thirdIdx], points[firstIdx], points[secondIdx]) {
//                    sameCount += 1
//                }
//
//                thirdIdx += 1
//            }
//
//            secondIdx += 1
//            thirdIdx = secondIdx + 1
//        }
//
//        firstIdx += 1
//        secondIdx = firstIdx + 1
//        thirdIdx = secondIdx + 1
//    }
//
//    return sameCount * 2
}


/**
 * Question Link: https://leetcode.com/problems/number-of-boomerangs/
 * Primary idea: traverse the array and compare distance one by one
 *
 * Time Complexity: O(n^2), Space Complexity: O(n)
 *
 */

func suggest_numberOfBoomerangs(_ points: [[Int]]) -> Int {
    var num = 0
    
    for (i, point) in points.enumerated() {
        var dict = [Int: Int]()
        for (j, anotherpoint) in points.enumerated() {
            if i == j {
                continue
            }
            
            let distance = (anotherpoint[0] - point[0]) * (anotherpoint[0] - point[0])  + (anotherpoint[1] - point[1]) * (anotherpoint[1] - point[1])
            
            if let sameDistancePoints = dict[distance] {
                dict[distance] = sameDistancePoints + 1
            } else {
                dict[distance] = 1
            }
        }
        
        for key in dict.keys {
            num += dict[key]! * (dict[key]! - 1)
        }
    }
    return num
}


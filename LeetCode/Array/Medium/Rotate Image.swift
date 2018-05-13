//
//  Rotate Image.swift
//  LeetCode
//
//  Created by Keith on 2018/5/13.
//  Copyright © 2018年 Keith Lee. All rights reserved.
//

import Foundation
//48. Rotate Image
//You are given an n x n 2D matrix representing an image.
//
//Rotate the image by 90 degrees (clockwise).
//
//Note:
//
//You have to rotate the image in-place, which means you have to modify the input 2D matrix directly. DO NOT allocate another 2D matrix and do the rotation.
//
//Example 1:
//
//Given input matrix =
//[
//[1,2,3],
//[4,5,6],
//[7,8,9]
//],
//
//rotate the input matrix in-place such that it becomes:
//[
//[7,4,1],
//[8,5,2],
//[9,6,3]
//]
//Example 2:
//
//Given input matrix =
//[
//[ 5, 1, 9,11],
//[ 2, 4, 8,10],
//[13, 3, 6, 7],
//[15,14,12,16]
//],
//
//rotate the input matrix in-place such that it becomes:
//[
//[15,13, 2, 5],
//[14, 3, 4, 1],
//[12, 6, 8, 9],
//[16, 7,10,11]
//]

func rotate(_ matrix: inout [[Int]]) {
    guard matrix.count > 1 else { return }
    for round in 0..<matrix.count/2 {
        let sqaureLength = matrix.count - (round * 2)
        guard sqaureLength > 1 else { return }
        let edge = matrix.count - 1 - round
        for i in round...edge {
            let fromPoint = Point(row: round, column: i)
            let point1 = Point(row: round + i, column: edge)
            let point2 = Point(row: edge, column: edge - i)
            let point3 = Point(row: edge - i, column: round)
            
            swap(point1: fromPoint, point2: point1, source: &matrix)
            swap(point1: fromPoint, point2: point2, source: &matrix)
            swap(point1: fromPoint, point2: point3, source: &matrix)
        }
    }
}

struct Point {
    var row: Int
    var column: Int
}

func swap(point1: Point, point2: Point, source: inout [[Int]]) {
    let temp = source[point1.row][point1.column]
    source[point1.row][point1.column] = source[point2.row][point2.column]
    source[point2.row][point2.column] = temp
}

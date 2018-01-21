
//
//  Island Perimeter.swift
//  LeetCode
//
//  Created by Keith Lee on 2018/1/20.
//  Copyright © 2018年 Keith Lee. All rights reserved.
//

import Foundation

/*
 463. Island Perimeter
 You are given a map in form of a two-dimensional integer grid where 1 represents land and 0 represents water. Grid cells are connected horizontally/vertically (not diagonally). The grid is completely surrounded by water, and there is exactly one island (i.e., one or more connected land cells). The island doesn't have "lakes" (water inside that isn't connected to the water around the island). One cell is a square with side length 1. The grid is rectangular, width and height don't exceed 100. Determine the perimeter of the island.
 
 Example:
 
 [[0,1,0,0],
 [1,1,1,0],
 [0,1,0,0],
 [1,1,0,0]]
 
 Answer: 16

 */

func islandPerimeter(_ grid: [[Int]]) -> Int {
    var perimeter: Int = 0
    for (i, row) in grid.enumerated() {
        for (y, item) in row.enumerated() {
            guard item == 1 else { continue }
            
            perimeter += 4
            
            if i > 0 {
                let up = grid[i - 1][y]
                if up == 1 {
                    perimeter -= 1
                }
            }
            
            if i < grid.count - 1 {
                let down = grid[i + 1][y]
                if down == 1 {
                    perimeter -= 1
                }
            }
            
            if y > 0 {
                let left = row[y - 1]
                if left == 1 {
                    perimeter -= 1
                }
            }
            
            if y < row.count - 1 {
                let right = row[y + 1]
                if right == 1 {
                    perimeter -= 1
                }
            }
        }
    }
    
    return perimeter
}



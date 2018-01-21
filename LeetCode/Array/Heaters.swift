//
//  Heaters.swift
//  LeetCode
//
//  Created by Keith Lee on 2018/1/20.
//  Copyright © 2018年 Keith Lee. All rights reserved.
//

import Foundation
/*
475. Heaters
Winter is coming! Your first job during the contest is to design a standard heater with fixed warm radius to warm all the houses.

Now, you are given positions of houses and heaters on a horizontal line, find out minimum radius of heaters so that all houses could be covered by those heaters.

So, your input will be the positions of houses and heaters seperately, and your expected output will be the minimum radius standard of heaters.

Note:
Numbers of houses and heaters you are given are non-negative and will not exceed 25000.
Positions of houses and heaters you are given are non-negative and will not exceed 10^9.
As long as a house is in the heaters' warm radius range, it can be warmed.
All the heaters follow your radius standard and the warm radius will the same.
Example 1:
Input: [1,2,3],[2]
Output: 1
Explanation: The only heater was placed in the position 2, and if we use the radius 1 standard, then all the houses can be warmed.
Example 2:
Input: [1,2,3,4],[1,4]
Output: 1
Explanation: The two heater was placed in the position 1 and 4. We need to use radius 1 standard, then all the houses can be warmed.
*/


//MARK: My Answer, not efficent enough
func findRadius(_ houses: [Int], _ heaters: [Int]) -> Int {
    let heatersToUse = houses.map { house -> Int in
        var heaterToUse: Int = Int.max
        var minDistance: Int = Int.max
        for heater in heaters {
            if abs(heater - house) < minDistance {
                minDistance = abs(heater - house)
                heaterToUse = heater
            }
        }
        
        return heaterToUse
    }
    
    var maxPossibleDistance: Int = 0
    for idx in (0..<houses.count) {
        let heater = heatersToUse[idx]
        let house = houses[idx]
        let distance = abs(heater - house)
        if distance > maxPossibleDistance {
            maxPossibleDistance = distance
        }
    }
    
    
    return maxPossibleDistance
}

//MARK: - Suggest Answer
func suggest_findRadius(_ houses: [Int], _ heaters: [Int]) -> Int {
    var i = 0, radius = 0
    let houses = houses.sorted(), heaters = heaters.sorted()
    
    for house in houses {
        //to find the nearest heater of the house
        while i < heaters.count - 1 &&  house * 2 >= (heaters[i] + heaters[i + 1])  {
            //Means the distance from house to heaters[i+1] is nearer than heater[i]
            i += 1
        }
        
        //check if the radius of neareset heater of this house is greater than the prev radius.
        radius = max(radius, abs(house - heaters[i]))
    }
    
    return radius
}


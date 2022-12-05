//
//  ScheduleDataModel.swift
//  AdventOfCodeDay4
//
//  Created by Robert Faist on 12/4/22.
//

import Foundation

struct ScheduleDataModel {
    let firstSection: ClosedRange<Int>
    let secondSection: ClosedRange<Int>
}

extension Array where Element.Type == ScheduleDataModel.Type {
    func countCombinedRanges() -> Int {
        var count = 0
        
        self.forEach { schedule in
            var matches = 0
            var firstSecondMatch = 0
            
            schedule.firstSection.sorted().forEach({ rangeValue in
                if schedule.secondSection.contains(rangeValue) {
                    matches += 1
                }
            })
                
            if matches == schedule.firstSection.count {
                firstSecondMatch += 1
            }
            
            matches = 0
            var secondFirstMatch = 0
            
            schedule.secondSection.sorted().forEach({ rangeValue in
                if schedule.firstSection.contains(rangeValue) {
                    matches += 1
                }
            })
                
            if matches == schedule.secondSection.count {
                secondFirstMatch += 1
            }
            
            if firstSecondMatch > 0 || secondFirstMatch > 0 {
                count += 1
            }
        }
        
        return count
    }
    
    func countOverlapRanges() -> Int {
        var count = 0
        
        self.forEach { schedule in
            if schedule.firstSection.overlaps(schedule.secondSection) ||
                schedule.secondSection.overlaps(schedule.firstSection) {
                count += 1
            }
        }
        
        return count
    }
}



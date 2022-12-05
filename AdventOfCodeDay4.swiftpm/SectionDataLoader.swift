//
//  SectionDataLoader.swift
//  AdventOfCodeDay4
//
//  Created by Robert Faist on 12/4/22.
//

import Foundation

class SectionDataLoader {
    private let fileName = "adventofcode_day4_input"
    
    func loadData() -> [ScheduleDataModel] {
        guard let fileUrl = Bundle.main.url(forResource: fileName, withExtension: "txt"),
              let fileContents = try? String(contentsOf: fileUrl) else {
            return []
        }
        
        let lines = fileContents.split(separator: "\n")
        
        var schedules: [ScheduleDataModel] = []
        
        lines.forEach { line in
            let sections = line.split(separator: ",")
            
            let section1 = sections[0].split(separator: "-")
            let section2 = sections[1].split(separator: "-")
            
            if let section1lowerBounds = Int(section1[0]),
               let section1upperBounds = Int(section1[1]),
               let section2lowerBounds = Int(section2[0]),
               let section2upperBounds = Int(section2[1]) {

                schedules.append(ScheduleDataModel(firstSection: section1lowerBounds...section1upperBounds,
                                                   secondSection: section2lowerBounds...section2upperBounds))
            }
        }
        
        return schedules
    }
}

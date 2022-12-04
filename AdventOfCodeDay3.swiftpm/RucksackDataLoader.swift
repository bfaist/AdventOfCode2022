//
//  RucksackDataLoader.swift
//  AdventOfCodeDay3
//
//  Created by Robert Faist on 12/3/22.
//

import Foundation

class RucksackDataLoader {
    private let fileName = "adventofcode_day3_input"
    
    func loadData() -> [RuckSack] {
        guard let fileUrl = Bundle.main.url(forResource: fileName, withExtension: "txt"),
              let fileContents = try? String(contentsOf: fileUrl) else {
            return []
        }
        
        let lines = fileContents.split(separator: "\n")
        
        var rucksacks: [RuckSack] = []
        
        lines.forEach { line in
            let compartmentLength = line.count / 2
            
            let compartment1 = String(line).prefix(compartmentLength)
            let compartment2 = String(line).suffix(compartmentLength)
            
            rucksacks.append(RuckSack(compartment1: String(compartment1),
                                      compartment2: String(compartment2)))
        }
        
        return rucksacks
    }
    
    func loadGroups() -> [RuckSackGroup] {
        guard let fileUrl = Bundle.main.url(forResource: fileName, withExtension: "txt"),
              let fileContents = try? String(contentsOf: fileUrl) else {
            return []
        }
        
        let lines = fileContents.split(separator: "\n")
        
        var rucksackGroups: [RuckSackGroup] = []
        var groupContainer: [String] = []
        
        lines.forEach { line in
            groupContainer.append(String(line))
            
            if groupContainer.count == 3 {
                rucksackGroups.append(RuckSackGroup(sack1: groupContainer[0], sack2: groupContainer[1], sack3: groupContainer[2]))
                groupContainer.removeAll()
            }
        }
        
        return rucksackGroups
    }
}

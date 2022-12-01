//
//  File.swift
//  AdventOfCodeDay1
//
//  Created by Robert Faist on 12/1/22.
//

import Foundation

class ElfMealDataLoader {
    private let fileName = "adventofcode_day1_input"
    
    func readData() -> [Elf] {
        guard let fileUrl = Bundle.main.url(forResource: fileName, withExtension: "txt"),
              let fileContents = try? String(contentsOf: fileUrl) else {
            return []
        }
        
        let lines = fileContents.split(separator: "\n", omittingEmptySubsequences: false)
        
        var elfs: [Elf] = []
        var currentElfId = 1
        
        var meals: [ElfMeal] = []
        
        lines.map { String($0) }.enumerated().forEach({ element in
            guard !element.element.isEmpty, let calories = Int(element.element) else {
                elfs.append(Elf(meals: meals, id: currentElfId))
                currentElfId += 1
                meals.removeAll()
                return
            }
            
            meals.append(ElfMeal(calories: calories))
        })
        
        return elfs
    }
}

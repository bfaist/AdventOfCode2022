//
//  File.swift
//  AdventOfCodeDay1
//
//  Created by Robert Faist on 12/1/22.
//

import Foundation

struct ElfMeal {
    let calories: Int
}

struct Elf {
    let meals: [ElfMeal]
    let id: Int
    
    var totalCalories: Int {
        meals.reduce(0) { partialResult, meal in
            partialResult + meal.calories
        }
    }
}

extension Array where Element.Type == Elf.Type {
    func sortedByTotalCaloriesDescending() -> [Elf] {
        self.sorted(by: { $0.totalCalories > $1.totalCalories  })
    }
    func topElf() -> Elf? {
        self.sortedByTotalCaloriesDescending().first
    }
    
    func topElfs(_ number: Int) -> [Elf] {
        Array(self.sortedByTotalCaloriesDescending().prefix(upTo: number))
    }
    
    func totalCalories() -> Int {
        self.reduce(0) { partialResult, elf in
            partialResult + elf.totalCalories
        }
    }
}

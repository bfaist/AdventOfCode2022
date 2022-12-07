//
//  StackMoveDataLoader.swift
//  AdventOfCodeDay5
//
//  Created by Robert Faist on 12/5/22.
//

import Foundation

class StackMoveDataLoader {
    private let fileName = "adventofcode_day5_input"
    
    func loadData() -> [StackMove] {
        guard let fileUrl = Bundle.main.url(forResource: fileName, withExtension: "txt"),
              let fileContents = try? String(contentsOf: fileUrl) else {
            return []
        }
        
        let lines = fileContents.split(separator: "\n")
        
        var moves: [StackMove] = []
        
        lines.forEach { line in
            let lineParts = line.split(separator: " ")
            
            if let qty = Int(lineParts[1]),
               let fromStack = Int(lineParts[3]),
               let toStack = Int(lineParts[5]) {
                moves.append(StackMove(qty: qty, fromStack: fromStack, toStack: toStack))
            }
        }
        
        return moves
    }
    
    func loadStacks() -> StackDataModel {
        let model = StackDataModel()
        
        model.stacks.removeAll()
        model.stacks.append(["D", "H", "N", "Q", "T", "W", "V", "B"].map({ Crate(crate: $0)}))
        model.stacks.append(["D", "W", "B"].map({ Crate(crate: $0)}))
        model.stacks.append(["T", "S", "Q", "W", "J", "C"].map({ Crate(crate: $0)}))
        model.stacks.append(["F", "J", "R", "N", "Z", "T", "P"].map({ Crate(crate: $0)}))
        model.stacks.append(["G", "P", "V", "J", "M", "S", "T"].map({ Crate(crate: $0)}))
        model.stacks.append(["B", "W", "F", "T", "N"].map({ Crate(crate: $0)}))
        model.stacks.append(["B", "L", "D", "Q", "F", "H", "V", "N"].map({ Crate(crate: $0)}))
        model.stacks.append(["H", "P", "F", "R"].map({ Crate(crate: $0)}))
        model.stacks.append(["Z", "S", "M", "B", "L", "N", "P", "H"].map({ Crate(crate: $0)}))
        
        return model
    }
}

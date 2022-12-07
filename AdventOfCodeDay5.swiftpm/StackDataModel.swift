//
//  StackDataModel.swift
//  AdventOfCodeDay5
//
//  Created by Robert Faist on 12/5/22.
//

import Foundation

class StackDataModel {
    var stacks: [[Crate]] = [[]]
    
    func topStacks() -> String {
        var topStackIDs = ""
        stacks.forEach { crates in
            if let lastCrate = crates.last {
                topStackIDs += lastCrate.crate
            }
        }
        return topStackIDs
    }
}

struct Crate: Identifiable, Hashable {
    let id = UUID().uuidString
    let crate: String
}

struct StackMove {
    let qty: Int
    let fromStack: Int
    let toStack: Int
}

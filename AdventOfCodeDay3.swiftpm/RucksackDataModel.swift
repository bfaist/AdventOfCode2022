//
//  RucksackDataModel.swift
//  AdventOfCodeDay3
//
//  Created by Robert Faist on 12/3/22.
//

import Foundation

struct RuckSack: Identifiable {
    let id: String = UUID().uuidString
    
    let compartment1: String
    let compartment2: String
    
    func commonItemType() -> ItemType? {
        var commonItemType: String = ""
        
        compartment1.forEach { char in
            if compartment2.contains(char) {
                commonItemType = String(char)
            }
        }
        
        return commonItemType != "" ? ItemType(type: commonItemType) : nil
    }
}

struct ItemType {
    let type: String
    
    var priority: Int {
        guard let scalarValue = Character(type).unicodeScalars.first?.value else {
            return 0
        }
        let offset: UInt32 = type.isUppercase() ? 38 : 96
        return Int(scalarValue - offset)
    }
}

struct RuckSackGroup: Identifiable {
    let id: String = UUID().uuidString
    
    let sack1: String
    let sack2: String
    let sack3: String
    
    func commonItemType() -> ItemType? {
        var commonItemType: String = ""

        sack1.forEach { item in
            if let _ = sack2.firstIndex(of: item),
               let _ = sack3.firstIndex(of: item) {
                  commonItemType = String(item)
            }
        }
        
        return commonItemType != "" ? ItemType(type: commonItemType) : nil
    }
}

extension String {
    func isUppercase() -> Bool {
        var foundLower = false
        self.unicodeScalars.forEach { us in
            if !CharacterSet.uppercaseLetters.contains(us) {
                foundLower = true
            }
        }
        
        return !foundLower
    }
}

extension Array where Element.Type == RuckSack.Type {
    func prioritySum() -> Int {
        self.reduce(0) { partialResult, nextRuckSack in
            partialResult + Int(nextRuckSack.commonItemType()?.priority ?? 0)
        }
    }
}

extension Array where Element.Type == RuckSackGroup.Type {
    func prioritySum() -> Int {
        self.reduce(0) { partialResult, nextGroup in
            partialResult + Int(nextGroup.commonItemType()?.priority ?? 0)
        }
    }
}

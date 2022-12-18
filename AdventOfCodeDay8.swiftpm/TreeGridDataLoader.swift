//
//  TreeGridDataLoader.swift
//  AdventOfCodeDay8
//
//  Created by Robert Faist on 12/14/22.
//

import Foundation

class TreeGridDataLoader {
    private let fileName = "adventofcode_day8_input"
    
    func loadTreeGrid() -> GridDataModel? {
        guard let fileUrl = Bundle.main.url(forResource: fileName, withExtension: "txt"),
              let fileContents = try? String(contentsOf: fileUrl) else {
            return nil
        }
        
        let lines = fileContents.split(separator: "\n").map({ String($0) })
        
        var grid = GridDataModel()
        
        for line in lines {
            if #available(iOS 16.0, *) {
                let numArray = line.split(separator: "").map({ String($0) }).map({ Int($0)! })
                grid.grid.append(numArray)
            }
        }
        
        return grid
    }
}

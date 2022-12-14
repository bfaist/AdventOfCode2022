//
//  DataStreamLoader.swift
//  AdventOfCodeDay6
//
//  Created by Robert Faist on 12/6/22.
//

import Foundation

class DataStreamLoader {
    private let fileName = "adventofcode_day6_input"
    
    func loadStream() -> String {
        guard let fileUrl = Bundle.main.url(forResource: fileName, withExtension: "txt"),
              let fileContents = try? String(contentsOf: fileUrl) else {
            return ""
        }
        
        return fileContents
    }
}

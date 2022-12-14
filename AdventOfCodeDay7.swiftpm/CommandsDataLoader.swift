//
//  CommandsDataLoader.swift
//  AdventOfCodeDay7
//
//  Created by Robert Faist on 12/7/22.
//

import Foundation

class CommandsDataLoader {
    private let fileName = "adventofcode_day7_input"
    
    func loadCommandLog() -> Directory? {
        guard let fileUrl = Bundle.main.url(forResource: fileName, withExtension: "txt"),
              let fileContents = try? String(contentsOf: fileUrl) else {
            return nil
        }
        
        let lines = fileContents.split(separator: "\n").map({ String($0) })
        
        var cwd: Directory? = nil
        var rootDir: Directory? = nil
        var isListMode = false
        
        lines.forEach { line in
            if line.starts(with: "$") {
                let commandParts = line.split(separator: " ").map({ String($0) })
                
                switch commandParts[1] {
                case "cd":
                    let dirName = commandParts[2]
                    
                    if dirName == ".." {
                        cwd = cwd?.parentDirectory
                    } else {
                        let lastCwd = cwd
                        
                        if let nextDir = cwd?.childDirectories.first(where: { $0.name == dirName }) {
                            cwd = nextDir
                        } else {
                            cwd = Directory(name: commandParts[2])
                        }
                        cwd?.parentDirectory = lastCwd
                        
                        if cwd?.name == "/" {
                            rootDir = cwd
                        }
                    }
                    
                    isListMode = false
                    
                case "ls":
                    isListMode = true
                    
                default:
                    print("Invalid command \(commandParts[1])")
                }
            } else if isListMode {
                let outputParts = line.split(separator: " ").map({ String($0) })
                
                switch outputParts[0] {
                case "dir":
                    cwd?.childDirectories.append(Directory(name: outputParts[1]))
                    
                default:
                    if let fileSize = Int(outputParts[0]) {
                        cwd?.files.append(File(name: outputParts[1], size: fileSize))
                    }
                }
            }
        }
        
        return rootDir
    }
}

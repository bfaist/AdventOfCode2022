//
//  DirectoryModel.swift
//  AdventOfCodeDay7
//
//  Created by Robert Faist on 12/7/22.
//

import Foundation

struct File {
    let name: String
    let size: Int
}

extension File: CustomStringConvertible {
    var description: String {
        "FILE [\(name)] [\(size)]"
    }
}

class Directory {
    let name: String
    
    var childDirectories: [Directory] = []
    var files: [File] = []
    var parentDirectory: Directory? = nil
    
    init(name: String) {
        self.name = name
    }
    
    init(name: String, parentDirectory: Directory, childDirectories: [Directory], files: [File]) {
        self.name = name
        self.parentDirectory = parentDirectory
        self.childDirectories = childDirectories
        self.files = files
    }
    
    func size() -> Int {
        var totalSize = 0
        files.forEach { totalSize += $0.size }
        childDirectories.forEach { totalSize += $0.size() }
        return totalSize
    }
}

extension Directory: CustomStringConvertible {
    var description: String {
        var desc = "DIR [\(name)] PARENT DIR [\(parentDirectory?.name ?? "")]"
        childDirectories.forEach({ desc += "\n\($0.description)"})
        files.forEach({ desc += "\n\($0.description)" })
        return desc
    }
}

//
//  ViewModel.swift
//  AdventOfCodeDay7
//
//  Created by Robert Faist on 12/7/22.
//

import Foundation

class ViewModel: ObservableObject {
    private let dataLoader = CommandsDataLoader()
    
    @Published var rootDir: Directory?
    
    private let totalDiskSpace = 70_000_000
    private let minSpaceNeeded = 30_000_000
    
    func loadData() {
        rootDir = dataLoader.loadCommandLog()
    }
    
    func findDirectoriesLessThanSize(than: Int) -> Int {
        guard let rootDir = rootDir else { return 0 }
        
        var matchDirs: [Directory] = []
        
        directoriesTotalSizeLess(directory: rootDir, matchDirs: &matchDirs, than: than)
        
        var totalSize = 0
        matchDirs.forEach({ totalSize += $0.size() })
        return totalSize
    }
    
    func findSmallestDirectoriesGreaterThanSize(than: Int) -> Directory? {
        guard let rootDir = rootDir else { return nil }
        
        var matchDirs: [Directory] = []
        
        directoriesTotalSizeGreater(directory: rootDir, matchDirs: &matchDirs, than: than)
        
        return matchDirs.sorted(by: { $0.size() < $1.size() }).first
    }
    
    func sizeOfRootDir() -> Int {
        rootDir?.size() ?? 0
    }
    
    func sizeOfFreeSpace() -> Int {
        totalDiskSpace - sizeOfRootDir()
    }
    
    func minSizeToDelete() -> Int {
        minSpaceNeeded - sizeOfFreeSpace()
    }
    
    private func directoriesTotalSizeGreater(directory: Directory, matchDirs: inout [Directory], than: Int) {
        guard directory.childDirectories.count > 0 else { return }
        
        directory.childDirectories.forEach({ subDir in
            if subDir.size() > than {
                matchDirs.append(subDir)
            }
            directoriesTotalSizeGreater(directory: subDir, matchDirs: &matchDirs, than: than)
        })
    }
    
    private func directoriesTotalSizeLess(directory: Directory, matchDirs: inout [Directory], than: Int) {
        guard directory.childDirectories.count > 0 else { return }
        
        directory.childDirectories.forEach({ subDir in
            if subDir.size() <= than {
                matchDirs.append(subDir)
            }
            directoriesTotalSizeLess(directory: subDir, matchDirs: &matchDirs, than: than)
        })
    }
}

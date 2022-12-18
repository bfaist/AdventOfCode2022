//
//  ViewModel.swift
//  AdventOfCodeDay8
//
//  Created by Robert Faist on 12/14/22.
//

import Foundation

class ViewModel: ObservableObject {
    @Published var gridModel: GridDataModel? = nil
    @Published var visibleTreeCount: Int = 0
    
    private let dataLoader = TreeGridDataLoader()
    
    private var visibleRowColMap: [String:[GridDirection]] = [:]
    private var treeScenicScore: [String:Int] = [:]
    
    func loadData() {
        gridModel = dataLoader.loadTreeGrid()
        visibleTreeCount = findVisibleTrees()
    }
    
    func findVisibleTrees() -> Int {
        guard let gridModel = gridModel else { return 0 }
        
        let countRow = gridModel.grid.count
        let countColumn = gridModel.grid[0].count
        
        let edgeVisibleTreeCount = (countRow * 2) + ((countColumn - 2) * 2)
        
        var totalVisibleTreeCount = edgeVisibleTreeCount
        
        for rowIndex in 1..<(countRow - 1) {
            var rowTreeMax = gridModel.grid[rowIndex][0]
            
            for colIndex in 1..<(countColumn-1) {
                if gridModel.grid[rowIndex][colIndex] > rowTreeMax {
                    rowTreeMax = gridModel.grid[rowIndex][colIndex]
                    
                    updateVisibleMap(row: rowIndex, col: colIndex, direction: .left)
                }
            }
            
            rowTreeMax = gridModel.grid[rowIndex].last!
            
            for colIndex in (1..<(countColumn-1)).reversed() {
                if gridModel.grid[rowIndex][colIndex] > rowTreeMax {
                    rowTreeMax = gridModel.grid[rowIndex][colIndex]
                    
                    updateVisibleMap(row: rowIndex, col: colIndex, direction: .right)
                }
            }
        }
        
        for colIndex in (1..<(countColumn-1)) {
            var colTreeMax = gridModel.grid[0][colIndex]
            
            for rowIndex in 1..<(countRow-1) {
                if gridModel.grid[rowIndex][colIndex] > colTreeMax {
                    colTreeMax = gridModel.grid[rowIndex][colIndex]
                    
                    updateVisibleMap(row: rowIndex, col: colIndex, direction: .top)
                }
            }
            
            let lastRowIndex = gridModel.grid.count - 1
            colTreeMax = gridModel.grid[lastRowIndex][colIndex]
            
            for rowIndex in (1..<(countRow-1)).reversed() {
                if gridModel.grid[rowIndex][colIndex] > colTreeMax {
                    colTreeMax = gridModel.grid[rowIndex][colIndex]
                    
                    updateVisibleMap(row: rowIndex, col: colIndex, direction: .bottom)
                }
            }
        }
        
        totalVisibleTreeCount += visibleRowColMap.keys.count
        
        return totalVisibleTreeCount
    }
    
    private func updateVisibleMap(row: Int, col: Int, direction: GridDirection) {
        let key = "\(row):\(col)"
        
        if let _ = visibleRowColMap[key] {
            visibleRowColMap[key]?.append(direction)
        } else {
            visibleRowColMap[key] = []
            visibleRowColMap[key]?.append(direction)
        }
    }
}

//
//  ViewModel.swift
//  AdventOfCodeDay5
//
//  Created by Robert Faist on 12/5/22.
//

import Foundation

class ViewModel: ObservableObject {
    private let dataLoader =  StackMoveDataLoader()
    
    @Published var stacks: StackDataModel = StackDataModel()
    @Published var stackMoves: [StackMove] = []
    @Published var isDataMoved = false
    
    func loadData() {
        stacks = dataLoader.loadStacks()
        stackMoves = dataLoader.loadData()
    }
    
    func makeMovesPart1() {
        isDataMoved = false
        
        loadData()
        
        stackMoves.forEach { move in
            let fromStackIndex = move.fromStack - 1
            let toStackIndex = move.toStack - 1
            
            for _ in 1...move.qty {
                if let movedCrate = stacks.stacks[fromStackIndex].popLast() {
                    stacks.stacks[toStackIndex].append(movedCrate)
                }
            }
        }
        isDataMoved = true
    }
    
    func makeMovesPart2() {
        isDataMoved = false
        
        loadData()
        
        stackMoves.forEach { move in
            let fromStackIndex = move.fromStack - 1
            let toStackIndex = move.toStack - 1
            
            let moveRangeEndIndex = stacks.stacks[fromStackIndex].endIndex - 1
            let moveRangeStartIndex = moveRangeEndIndex - move.qty + 1
            
            if moveRangeStartIndex >= 0, moveRangeEndIndex == stacks.stacks[fromStackIndex].count - 1 {
                let stackToBeMoved = stacks.stacks[fromStackIndex][moveRangeStartIndex...moveRangeEndIndex]
                
                stacks.stacks[toStackIndex].append(contentsOf: stackToBeMoved)
                
                for _ in 1...move.qty {
                    _ = stacks.stacks[fromStackIndex].popLast()
                }
            }
            
            isDataMoved = true
        }
    }
}

//
//  ViewModel.swift
//  AdventOfCodeDay2
//
//  Created by Robert Faist on 12/2/22.
//

import Foundation

class ViewModel: ObservableObject {
    @Published var gameRoundsPart1: [GameRound] = []
    @Published var gameRoundsPart2: [GameRound] = []
    @Published var dataLoaded = false
    
    private let dataLoader = GuideDataLoader()
    
    func loadData() {
        gameRoundsPart1 = dataLoader.readDataPart1()
        gameRoundsPart2 = dataLoader.readDataPart2()
        dataLoaded = true
    }
}

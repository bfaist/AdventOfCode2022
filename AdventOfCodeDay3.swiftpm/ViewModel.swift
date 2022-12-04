//
//  ViewModel.swift
//  AdventOfCodeDay3
//
//  Created by Robert Faist on 12/3/22.
//

import Foundation

class ViewModel: ObservableObject {
    @Published var ruckSacks: [RuckSack] = []
    @Published var ruckSackGroups: [RuckSackGroup] = []
    @Published var isDataLoaded = false
    
    private let dataLoader = RucksackDataLoader()
    
    func loadData() {
        ruckSacks = dataLoader.loadData()
        ruckSackGroups = dataLoader.loadGroups()
        isDataLoaded = true
    }
}

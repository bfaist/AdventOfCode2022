//
//  ViewModel.swift
//  AdventOfCodeDay4
//
//  Created by Robert Faist on 12/4/22.
//

import Foundation

class ViewModel: ObservableObject {
    private let dataLoader = SectionDataLoader()
    
    @Published var isDataLoaded = false
    @Published var schedule: [ScheduleDataModel] = []
    
    func loadData() {
        schedule = dataLoader.loadData()
        isDataLoaded = true
    }
}

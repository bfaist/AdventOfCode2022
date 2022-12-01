//
//  File.swift
//  AdventOfCodeDay1
//
//  Created by Robert Faist on 12/1/22.
//

import Foundation

class ViewModel: ObservableObject {
    @Published var model: [Elf] = []
    
    @Published var dataLoaded = false
    
    private let dataLoader = ElfMealDataLoader()
    
    func retrieveData() {
        model = dataLoader.readData()
        dataLoaded = true
    }
}

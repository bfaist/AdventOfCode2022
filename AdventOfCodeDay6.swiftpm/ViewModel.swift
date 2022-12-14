//
//  ViewModel.swift
//  AdventOfCodeDay6
//
//  Created by Robert Faist on 12/6/22.
//

import Foundation

class ViewModel: ObservableObject {
    private let dataLoader = DataStreamLoader()
    
    @Published var dataStream: String?
    @Published var markerPosition: Int = -1
    @Published var messagePosition: Int = -1
    
    func loadData() {
        dataStream = dataLoader.loadStream()
        markerPosition = findStartPacketMarker(size: 4)
        messagePosition = findStartPacketMarker(size: 14)
    }
    
    func findStartPacketMarker(size: Int) -> Int {
        guard let dataStream = dataStream else { return -1 }
        
        var marker: [Character] = []
        var foundPosition = 0
        
        for (n, c) in dataStream.enumerated() {
            marker.append(c)
            
            if marker.count > size {
                marker.removeFirst()
            }
            
            if marker.count == size {
                if !marker.areThereDuplicates() {
                    foundPosition = n + 1
                    break
                }
            }
        }
        
        return foundPosition
    }
}

extension Array where Element.Type == Character.Type {
    func areThereDuplicates() -> Bool {
        var countMap: [Character:Int] = [:]
        var foundDup = false
        self.forEach { char in
            countMap[char, default: 0] += 1
            if let count = countMap[char], count > 1 {
                foundDup = true
            }
        }
        return foundDup
    }
}

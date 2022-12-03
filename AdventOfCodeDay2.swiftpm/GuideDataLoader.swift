//
//  File.swift
//  AdventOfCodeDay2
//
//  Created by Robert Faist on 12/2/22.
//

import Foundation

class GuideDataLoader {
    private let fileName = "adventofcode_day2_input"
    
    func readDataPart1() -> [GameRound] {
        guard let fileUrl = Bundle.main.url(forResource: fileName, withExtension: "txt"),
              let fileContents = try? String(contentsOf: fileUrl) else {
            return []
        }
        
        let lines = fileContents.split(separator: "\n")
        
        var rounds: [GameRound] = []

        lines.forEach { line in
            let moves = line.split(separator: " ")
            
            if let opponentMove = GameMove.create(move: String(moves[0])),
               let myMove = GameMove.create(move: String(moves[1])) {
                  rounds.append(GameRound(myMove: myMove, opponentMove: opponentMove))
            }
        }
        
        return rounds
    }
    
    func readDataPart2() -> [GameRound] {
        guard let fileUrl = Bundle.main.url(forResource: fileName, withExtension: "txt"),
              let fileContents = try? String(contentsOf: fileUrl) else {
            return []
        }
        
        let lines = fileContents.split(separator: "\n")
        
        var rounds: [GameRound] = []

        lines.forEach { line in
            let moves = line.split(separator: " ")
            
            if let opponentMove = GameMove.create(move: String(moves[0])),
               let gameOutcome = GameOutcome(rawValue: String(moves[1])) {
                 
                let myMove = GameMove.createFrom(outcome: gameOutcome, move: opponentMove)
                
                rounds.append(GameRound(myMove: myMove, opponentMove: opponentMove))
            }
        }
        
        return rounds
    }
}

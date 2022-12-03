//
//  GuideDataModel.swift
//  AdventOfCodeDay2
//
//  Created by Robert Faist on 12/2/22.
//

import Foundation

enum GameMove {
    case rock
    case paper
    case scissors
    
    var score: Int {
        switch self {
        case .rock:
            return 1
        case .paper:
            return 2
        case .scissors:
            return 3
        }
    }
    
    static func create(move: String) -> GameMove? {
        switch move {
        case "A", "X":
            return GameMove.rock
        case "B", "Y":
            return GameMove.paper
        case "C", "Z":
            return GameMove.scissors
        default:
            return nil
        }
    }
    
    static func createFrom(outcome: GameOutcome, move: GameMove) -> GameMove {
        switch outcome {
        case .draw:
            return move
        case .win:
            switch move {
            case .scissors:
                return .rock
            case .rock:
                return .paper
            case .paper:
                return .scissors
            }
        case .lost:
            switch move {
            case .scissors:
                return .paper
            case .rock:
                return .scissors
            case .paper:
                return .rock
            }
        }
    }
}

enum GameOutcome: String {
    case win = "Z"
    case draw = "Y"
    case lost = "X"
    
    var score: Int {
        switch self {
        case .win:
            return 6
        case .draw:
            return 3
        case .lost:
            return 0
        }
    }
}

struct GameRound {
    let myMove: GameMove
    let opponentMove: GameMove
    
    func myOutcome() -> GameOutcome {
        switch (myMove, opponentMove) {
        case (.rock, .rock),
             (.paper, .paper),
             (.scissors, .scissors):
            return .draw
        case (.rock, .paper),
             (.paper, .scissors),
             (.scissors, .rock):
            return .lost
        case (.rock, .scissors),
             (.paper, .rock),
             (.scissors, .paper):
            return .win
        }
    }
    
    func myRoundScore() -> Int {
        let moveScore = myMove.score
        let outcomeScore = myOutcome().score
        return moveScore + outcomeScore
    }
}

extension Array where Element.Type == GameRound.Type {
    func myTotalScore() -> Int {
        self.reduce(0) { partialResult, nextRound in
            partialResult + nextRound.myRoundScore()
        }
    }
}

//
//  File.swift
//  game
//
//  Created by Hieu C Trac on 1/13/21.
//

import Foundation

struct Game {
    static let targetRange = 0...100
    var target = Int.random(in: targetRange)
    var score = 0
    var round = 1
    var leaderboardEnties: [LeaderboardEntry] = []
    
    init(loadTestData: Bool = false) {
        if loadTestData {
            addToLeaderboard(points: 100)
            addToLeaderboard(points: 200)
            addToLeaderboard(points: 300)
        }
    }
    
    func points(value: Int) -> Int {
        let difference = 100 - abs(target - value)
        let bonus: Int
        switch difference {
        case 100:
            bonus = 100
        case 99:
            fallthrough
        case 98:
            bonus = 50
        default:
            bonus = 0
        }
        return difference + bonus
    }
    
    mutating func addToLeaderboard(points: Int) {
        leaderboardEnties.append(LeaderboardEntry(score: points, date: Date()))
        leaderboardEnties.sort{ $0.score > $1.score }
    }
    
    mutating func startNewRound(points: Int) {
        score += points
        round += 1
        target = Int.random(in: Game.targetRange)
        addToLeaderboard(points: points)
    }
    
    mutating func restart() {
        score = 0
        round = 1
        target = Int.random(in: Game.targetRange)
    }
}

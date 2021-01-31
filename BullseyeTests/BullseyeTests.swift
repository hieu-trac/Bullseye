//
//  Tests_iOS.swift
//  Tests iOS
//
//  Created by Hieu C Trac on 1/13/21.
//

import XCTest
@testable import Bullseye

class BullseyeTests: XCTestCase {

    var game: Game!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        game = Game()
        
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        game = nil
    }

    func testScorePositive() {
        let guess = game.target + 5
        let score = game.points(value: guess)
        XCTAssertEqual(score, 95)
    }

    func testScoreNegative() {
        let guess = game.target - 5
        let score = game.points(value: guess)
        XCTAssertEqual(score, 95)
    }
    
    func testNewRound() {
        
        game.startNewRound(points: 100)
        XCTAssertEqual(game.score, 100)
        XCTAssertEqual(game.round, 2)
    }
    
    func testScoreExact() {
        let guess = game.target
        let score = game.points(value: guess)
        XCTAssertEqual(score, 200)
    }
    
    func testScoreClose() {
        let guess = game.target + 2
        let score = game.points(value: guess)
        XCTAssertEqual(score, 98 + 50)
    }

    func testRestart() {
        
        game.startNewRound(points: 100)
        XCTAssertNotEqual(game.score, 0)
        XCTAssertNotEqual(game.round, 1)
        
        game.restart()
        XCTAssertEqual(game.score, 0)
        XCTAssertEqual(game.round, 1)
    }
    
    func testLeaderboard() {
        game.startNewRound(points: 100)
        XCTAssertEqual(game.leaderboardEnties.count, 1)
        XCTAssertEqual(game.leaderboardEnties[0].score, 100)
        
        game.startNewRound(points: 200)
        XCTAssertEqual(game.leaderboardEnties.count, 2)
        XCTAssertEqual(game.leaderboardEnties[0].score, 200)
        XCTAssertEqual(game.leaderboardEnties[1].score, 100)
    }
}

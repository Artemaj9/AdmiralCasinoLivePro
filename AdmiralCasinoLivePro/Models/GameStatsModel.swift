//
//  GameStats.swift
//

import Foundation

struct GameStats: Codable {
    let strategy: Int
    let income: Int
    let outcome: Int
    let time: Int
    let bankerWins: Int
    let pushCount: Int
    let playerWins: Int
}

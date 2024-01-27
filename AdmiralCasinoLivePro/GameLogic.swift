//
//  GameLogic.swift
//

import Foundation

class GameLogic: ObservableObject {
    
    @Published var isInitial = true
    @Published var isChoose = false
    @Published var isGame = false
    
    // 0 - banker 1 - player   -1 - initial
    @Published var side = -1

    @Published var bankerPoints = 0
    @Published var playerPoints = 0
    @Published var isPlayerThird = false
    @Published var isBankerThird = false

    @Published var balance = 10000
    @Published var income = 0
    @Published var outcome = 0
    @Published var bet = 0
    
    @Published var playerPercent = 0
    @Published var pushPercent = 0
    @Published var bankerPercent = 0
    
}



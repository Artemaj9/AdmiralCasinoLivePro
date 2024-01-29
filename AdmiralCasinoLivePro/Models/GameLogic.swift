//
//  GameLogic.swift
//

import SwiftUI
import Combine
import Foundation

class GameLogic: ObservableObject {
    
    @Published var isSplash = true
    @Published var isSelection = true
    @Published var isInitial = false
    @Published var isChoose = false
    @Published var isGame = false
    @Published var isPaused = false
    
    
    @Published var focusOnPair = false
    // -1 - banker 1 - player
    @Published var side = -10

    @Published var bankerPoints = 0
    @Published var playerPoints = 0
    
    @Published var playerWinsCount = 0
    @Published var bankerWinsCount = 0
    @Published var pushCount = 0
    
    @Published var isPlayerThird = false
    @Published var isBankerThird = false

    @Published var balance = 10000
    @Published var income = 0
    @Published var outcome = 0
    @Published var bet = 0
    @Published var strategy = 3
    
    @Published var playerPercent = 0
    @Published var pushPercent = 0
    @Published var bankerPercent = 0
    @Published var count = 0
    
    @Published var bankerCards: [CardModel] = []
    //[CardModel(image: "jacks"), CardModel(image: "7h")]
    @Published var playerCards = [CardModel]()
    @Published var allDeckCards = [CardModel]()
    @Published var twoCardsDone = false
    
    @Published var whoWin = -2
    // 0 - pusg 1 - player -1 banker
    @Published var gameOver = false
    @Published var showDescription = false
  
    @Published var cardTimerCount = 0
    var size: CGSize = CGSize(width: 430, height: 932)
    
    var cardTimer: AnyCancellable?
    var gameStats = [GameStats]()
    
    
    let cardNames = ["2", "3", "4", "5", "6", "7", "8", "9", "10", "jack", "queen", "king", "ace"]
    
    
    func resetToInitial () {
        
        for item in cancellables {
            item.cancel()
        }
        isSelection = true
        isInitial = false
        isChoose = false
        isGame = false
        isPaused = false
        // -1 - banker 1 - player
        side = -10

        bankerPoints = 0
        playerPoints = 0
        
        playerWinsCount = 0
       bankerWinsCount = 0
        pushCount = 0
        
        isPlayerThird = false
        isBankerThird = false

        balance = 10000
        income = 0
        outcome = 0
        bet = 0
        strategy = 3
        
        playerPercent = 0
        pushPercent = 0
        bankerPercent = 0
        count = 0
        twoCardsDone = false
        gameOver = false
        cardTimerCount = 0
        focusOnPair = false
    }
    
    func addCards() {
        allDeckCards = []
        for cardName in cardNames {
            allDeckCards.append(CardModel(image: cardName + "s"))
            allDeckCards.append(CardModel(image: cardName + "d"))
            allDeckCards.append(CardModel(image: cardName + "h"))
            allDeckCards.append(CardModel(image: cardName + "c"))
        }
        allDeckCards.shuffle()
    }
    
    func dealCards() {
        bankerCards.append(allDeckCards.last!)
        playerCards.append(allDeckCards.last!)
    }
    
    private var cancellables = Set<AnyCancellable>()
    
    func setupTimer() {
        Timer
            .publish(every: 1, on: .main, in: .common)
            .autoconnect()
            .sink { [unowned self] _ in
                
                if !isPaused && !showDescription {
                    count += 1
                }
            }
            .store(in: &cancellables)
    }
    
    func checkWinner () {
        gameOver = true
        self.cardTimer?.cancel()
        Timer.scheduledTimer(withTimeInterval: 0.7, repeats: false) { timer in
            withAnimation {
      
                if self.bankerPoints > self.playerPoints {
                    self.whoWin = -1
                } else if self.bankerPoints == self.playerPoints {
                    self.whoWin = 0
        } else {
            self.whoWin = 1
        }
//        print("Очки банкира: \(bankerPoints)")
//        print("Очки игрока: \(playerPoints)")
//        print("Победил: \(whoWin)")
            }
        }

    }
    
    func addLastCardtoBanker() {
        bankerCards.append(allDeckCards.last ?? CardModel(image: "aceh"))
        allDeckCards.shuffle()
        bankerPoints += bankerCards.last?.number ?? 0
        bankerPoints = bankerPoints % 10
        isBankerThird = true
        checkWinner()
    }
    
    
    func percent(_ count: Int) -> Int {
        if playerWinsCount + bankerWinsCount + pushCount != 0 {
            return Int((100 * CGFloat(count)/CGFloat(playerWinsCount + bankerWinsCount + pushCount)).rounded())
        } else {
            return 0
        }
    }
    
    func finalizeRound() {
        if focusOnPair  {
            if ((side == -1 && bankerCards.count == 2) || (side == 1 && playerCards.count == 2)) && (bankerCards[0].number == bankerCards[1].number) && whoWin == side {
                balance = bet  * 11
                income += bet * 10
            } else  {
                outcome += bet
                bet = 0
            }
        }
        
        if !focusOnPair {
            if side == 0 && whoWin == 0 {
                balance += bet * 9
                income += bet * 8
            } else if side == 0 && whoWin != 0{
                outcome += bet
                bet = 0
            } else {
                if whoWin == side  {
                    balance += bet*2
                    income += bet
                } else {
                    outcome += bet
                    bet = 0
                    
                }
            }
        }
            
            if whoWin == 1 {
                playerWinsCount += 1
            } else if whoWin == -1 {
                bankerWinsCount += 1
            } else if whoWin == 0 {
                pushCount += 1
            }
        
        
        playerPercent = percent(playerWinsCount)
        bankerPercent = percent(bankerWinsCount)
        pushPercent = percent(pushCount)
        
        
        print("Количество ничей: \(pushCount)")
        playerCards = []
        bankerCards =  []
        playerPoints = 0
        bankerPoints = 0
        gameOver = false
        isPlayerThird = false
        isBankerThird = false
        side = -10
        bet = 0
        whoWin = -2
        cardTimerCount = 0
        twoCardsDone = false
        isGame = false
        isChoose = false
        isInitial = true
    }
    
    func setUpCardTimer() {
        cardTimerCount = 0
         cardTimer = Timer
            .publish(every: 1, on: .main, in: .common)
            .autoconnect()
            .sink { [unowned self] _ in
                if !isPaused {
                    cardTimerCount += 1
                    print("Timercount:\(cardTimerCount)")
                    print("Two cards done: \(twoCardsDone)")
                    
                    if isPlayerThird && !gameOver && twoCardsDone {
                        
                        print("Зашли в первый if")
                        if (playerCards.last?.number == 9 || playerCards.last?.number == 1 ||
                            playerCards.last?.image.contains("10") != nil) && (bankerPoints < 4)  {
                            addLastCardtoBanker()
                        } else if playerCards.last?.number == 8 && bankerPoints < 3 {
                            addLastCardtoBanker()
                        } else if (playerCards.last?.number == 6 || playerCards.last?.number == 7) && bankerPoints < 7 {
                            addLastCardtoBanker()
                        } else if (playerCards.last?.number == 4 || playerCards.last?.number == 5) && bankerPoints < 6 {
                            addLastCardtoBanker()
                        } else if (playerCards.last?.number == 2 || playerCards.last?.number == 3) &&  bankerPoints < 5 {
                            addLastCardtoBanker()
                        } else {
                            checkWinner()
                        }
                    }
                    // Здесь игра закончилась!!
                    // раздача первых двух карт
                    if !twoCardsDone {
                        if cardTimerCount.isMultiple(of: 2) && playerCards.count < 2 {
                            playerCards.append(allDeckCards.last ?? CardModel(image: "aceh"))
                            allDeckCards.shuffle()
                            playerPoints += playerCards.last?.number ?? 0
                        } else if bankerCards.count < 2 {
                            bankerCards.append(allDeckCards.last ?? CardModel(image: "aced"))
                            allDeckCards.shuffle()
                            bankerPoints += bankerCards.last?.number ?? 0
                        }
                        if playerCards.count == 2 && bankerCards.count == 2 {
                            bankerPoints = bankerPoints % 10
                            playerPoints = playerPoints % 10
                            twoCardsDone = true
                            print(bankerPoints)
                            print(playerPoints)
                        }
                    } else {
                        print("We in scope!")
                        
                        // если сумма у кого-то 8 или 9
                        if playerPoints >= 8 || bankerPoints >= 8 {
                            checkWinner()
                        }
                        
                        if !gameOver && (playerPoints == 6 || playerPoints == 7) {
                            checkWinner()
                        }
                        
                        // добавляем карту игроку
                        if !gameOver && !isPlayerThird && playerPoints <= 5 {
                            print("player < 5")
                            isPlayerThird = true
                            playerCards.append(allDeckCards.last ?? CardModel(image: "aceh"))
                            print("three cards to player done")
                            allDeckCards.shuffle()
                            playerPoints += playerCards.last?.number ?? 0
                            playerPoints = playerPoints % 10
                        }

                    }
                }
            }
        }
}



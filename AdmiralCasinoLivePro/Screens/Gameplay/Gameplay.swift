//
//  Gameplay.swift
//

import SwiftUI
import Combine

struct Gameplay: View {
   
    @EnvironmentObject var gm: GameLogic
    @Environment(\.dismiss) var dismiss
    @State var bet: String = ""
    @State private var keyboardHeight: CGFloat = 0

    
    init() {
           UITextField.appearance().keyboardAppearance = .light
      }
    
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                Image(GameImg.tablebg)
                    .resizable()
                    .scaledToFit()
                    .scaleEffect(x: 1.13)
                    .offset(y: gm.size.width < 380 ? 40 : 20)
                
                ZStack {
                    Image(GameImg.betbg)
                        .resizable()
                        .scaledToFit()
                        .overlay {
                            HStack {
                               // DelusionTF(text: $gm.bet)
                               
                                if gm.bet == 0 && bet.isEmpty {
                                    Text(gm.bet == 0 ? "PLACE YOUR BET" : "\(gm.bet)" )
                                        .font(.custom(CustomFont.extraBold, size: 18))
                                        .shadow(radius: 2, y: 2)
//                                        .onTapGesture {
//                                            bet = String(gm.bet)
//                                        }
                                }
                                if gm.bet > 0 || !bet.isEmpty {
                                    DelusionTF(text: $bet)
                                        .environmentObject(gm)
                                        .allowsHitTesting(gm.isInitial || gm.isChoose)
                                        .offset(x: gm.size.width*0.02)
                                       
//                                    Image(GameImg.coin)
//                                        .resizable()
//                                        .scaledToFit()
//                                        .frame(width: 35)
//                                        .offset(y: 4)
                                }
                            }
                            .offset(x: gm.bet > 0 ? 12 : 0)
                        }
                    
                    HStack {
                        Image(GameImg.minus)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 56, height: 48)
                            .onTapGesture {
                                if gm.isChoose && gm.bet > 500 {
                                    gm.bet -= 500
                                    gm.balance += 500
                                } else if gm.isChoose && gm.bet <= 500 && gm.bet > 100 {
                                    gm.bet -= 100
                                    gm.balance += 100
                                } else if gm.isChoose && gm.bet <= 100 && gm.bet > 10 {
                                    gm.bet -= 10
                                    gm.balance += 10
                                } else if gm.isChoose && gm.bet <= 10 && gm.bet > 1 {
                                    gm.bet -= 1
                                    gm.balance += 1
                                }
                                if gm.bet > 0 {
                                    bet = String(gm.bet)
                                }
                            }
                        
                        Spacer()
                        
                        Image(GameImg.plus)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 56, height: 48)
                            .onTapGesture {
                                if gm.isInitial && gm.balance > 500 {
                                    withAnimation {
                                        gm.bet += 500
                                        gm.balance -= 500
                                        gm.isInitial = false
                                        gm.isChoose = true
                                    }
                                }  else if  gm.isInitial && gm.balance > 100 && gm.balance <= 500 {
                                    withAnimation {
                                        gm.bet += 100
                                        gm.balance -= 100
                                        gm.isInitial = false
                                        gm.isChoose = true
                                    }
                                } else if  gm.isInitial && gm.balance > 10 && gm.balance <= 100 {
                                    withAnimation {
                                        gm.bet += 10
                                        gm.balance -= 10
                                        gm.isInitial = false
                                        gm.isChoose = true
                                    }
                                } else if  gm.isInitial && gm.balance > 0 && gm.balance <= 10 {
                                    withAnimation {
                                        gm.bet += 1
                                        gm.balance -= 1
                                        gm.isInitial = false
                                        gm.isChoose = true
                                    }
                                } else if gm.isChoose && gm.balance >= 500 {
                                    gm.bet += 500
                                    gm.balance -= 500
                                } else if gm.isChoose && gm.balance < 500 && gm.balance >= 100 {
                                    gm.bet += 100
                                    gm.balance -= 100
                                }  else if gm.isChoose && gm.balance < 100 && gm.balance >= 10 {
                                    gm.bet += 10
                                    gm.balance -= 10
                                }  else if gm.isChoose && gm.balance < 10 && gm.balance >= 1  {
                                    gm.bet += 1
                                    gm.balance -= 1
                                }
                                bet = String(gm.bet)
                            }
                    }
                }
                .padding(.horizontal, 18)
                .offset(y: gm.size.width > 380 ? 0 : 24)
                .offset(y: -keyboardHeight*0.4)
                
                HStack(spacing: 0) {
                    Image(GameImg.playerslot)
                        .resizable()
                        .scaledToFit()
                        .overlay {
                            Text("\(gm.playerPercent)%")
                                .font(.custom(CustomFont.extraBold, size: 18))
                                .foregroundStyle(Pallete.lightgreen)
                        }
                    
                    Image(GameImg.pushslot)
                        .resizable()
                        .scaledToFit()
                        .overlay {
                            Text("\(gm.pushPercent)%")
                                .font(.custom(CustomFont.extraBold, size: 18))
                                .foregroundStyle(Pallete.lightblue)
                        }
                    
                    Image(GameImg.bankerslot)
                        .resizable()
                        .scaledToFit()
                        .overlay {
                            Text("\(gm.bankerPercent)%")
                                .font(.custom(CustomFont.extraBold, size: 18))
                                .foregroundStyle(Pallete.lightpink)
                        }
                }
                .offset(y: gm.size.width > 380 ? 0 : 24)
            }
            
            VStack {
                Image(GameImg.headerbg)
                    .resizable()
                    .scaledToFit()
                    .scaleEffect(y: 1.02)
                Spacer()
            }
            
            VStack(spacing: 0) {
                    HStack {
                        VStack {
                            Image(GameImg.balance)
                                .resizable()
                                .scaledToFit()
                                .overlay(content: {
                                    Text("\(gm.balance)")
                                        .font(.custom(CustomFont.medium, size: 16))
                                        .foregroundStyle(Pallete.balanceyellow)
                                        .offset(x: 16)
                                })
                                .padding(.horizontal)
                                .padding(.top, 8)
                                  
                            HStack {
                                Image(GameImg.outcome)
                                    .resizable()
                                    .scaledToFit()
                                    .overlay {
                                        Text("-\(gm.outcome)")
                                            .font(.custom(CustomFont.medium, size: 14))
                                            .foregroundStyle(Pallete.outcome)
                                            .offset(x: 8, y: -4)
                                    }
                                    .frame(height: 40)
                              
                                Image(GameImg.income)
                                    .resizable()
                                    .scaledToFit()
                                    .overlay {
                                        Text("+\(gm.income)")
                                            .font(.custom(CustomFont.medium, size: 14))
                                            .foregroundStyle(Pallete.income)
                                            .offset(x: 8, y: -4)
                                    }
                                    .frame(height: 40)
                            }
                        }
                        Button {
                            gm.isPaused = true
                        } label: {
                            Image(GameImg.burger)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 40, height: 40)
                                .padding(.trailing, 8)
                        }
                    }
                   .offset(y: 8)
            
                Image(GameImg.strategyBar)
                    .resizable()
                    .scaledToFit()
                    .overlay {
                        HStack {
                            Text(strategyTitle[gm.strategy-1])
                            Button {
                                gm.showDescription = true
                            } label: {
                                    Image(Img.info)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 35, height: 35)
                                        .padding(.trailing)
                            }
                        }
                        .offset(x: 30)
                    }
                   .offset(y: 4)
                Spacer()
            }
            .offset(y: gm.size.width > 380 ? 28 : 14)
            
            VStack(spacing: gm.size.width > 380 ? gm.size.height * 0.05 : gm.size.height * 0.01 ) {
                
                Button {
                    let betnow = Int(bet) ?? 0
                    gm.balance += gm.bet
                    if betnow > gm.balance {
                        gm.bet = 1
                        gm.balance -= 1
                        bet = "1"
                    } else {
                        gm.bet = betnow
                        gm.balance -= gm.bet
                    }
                        
                    gm.side = -1
                  //  gm.bet = Int(bet) ?? 0
                    gm.isChoose = false
                    gm.isGame = true
                    gm.setUpCardTimer()
                    if gm.count == 0 {
                        gm.setupTimer()
                    }
                
                } label: {
                    Image(GameImg.rect)
                        .resizable()
                        .scaledToFit()
                        .frame(width: gm.size.width > 380 ? gm.size.width * 0.7 : gm.size.width * 0.6)
                        .shadow(color: .white, radius: gm.isChoose || gm.side == -1 ? 4 : 0)
                        .overlay(alignment: .top) {
                            VStack(spacing: 12) {
                                Text("BANKER")
                                    .font(.custom(CustomFont.extraBold, size: 28))
                                    .foregroundStyle(.white.opacity(gm.isChoose || gm.whoWin == -1 ? 1 : 0.5))
                                    .padding(.top,  8)
                                HStack {
                                    ForEach(gm.bankerCards) { card in
                                        Card(isFlipped: false, needToRotate: true, image: card.image, width: gm.size.width > 380 ? 75 : 60, height: gm.size.width > 380 ? 100 : 80)
                                    }
                                }
                            }
                        }
                }
                .allowsHitTesting(gm.isChoose)

                Button {
                    gm.side = 1
                   // gm.bet = Int(bet) ?? 0
                    gm.isChoose = false
                    gm.isGame = true
                    gm.setUpCardTimer()
                    
                } label: {
                    Image(GameImg.rect)
                        .resizable()
                        .scaledToFit()
                        .frame(width: gm.size.width > 380 ? gm.size.width * 0.7 : gm.size.width * 0.6)
                        .shadow(color: .white, radius: gm.isChoose || gm.side == 1  ? 4 : 0)
                        .overlay(alignment: .bottom) {
                            VStack(spacing: 12) {
                                
                                HStack {
                                    ForEach(gm.playerCards) { card in
                                        Card(isFlipped: false, needToRotate: true, image: card.image, width: gm.size.width > 380 ? 75 : 60, height: gm.size.width > 380 ? 100 : 80)
                                    }
                                }
                                
                                Text("PLAYER")
                                    .font(.custom(CustomFont.extraBold, size: 28))
                                    .foregroundStyle(.white.opacity(gm.isChoose || gm.whoWin == 1 ? 1 : 0.5))
                                    .padding(.bottom, 12)
                          
                            }
                        }
                        .padding(4)
                }
                .opacity(keyboardHeight > 0 ? 0 : 1)
                .allowsHitTesting(gm.isChoose)
            }
            .offset(y: gm.size.width > 380 ? 0 : 12)
         
            .overlay {
                if gm.isChoose {
                    ZStack {
                        Image(GameImg.gradgreen)
                            .resizable()
                            .scaledToFit()
                        Text("CHOOSE YOUR SIDE")
                            .multilineTextAlignment(.center)
                            .font(.custom(CustomFont.extraBold, size: gm.size.width > 380  ? 28 : 20 ))
                            .foregroundStyle(.white)
                            .shadow(radius: 4, y: 4)
                            .onTapGesture {
                                
                                let betnow = Int(bet) ?? 0
                                gm.balance += gm.bet
                                if betnow > gm.balance {
                                    gm.bet = 1
                                    gm.balance -= 1
                                    bet = "1"
                                } else {
                                    gm.bet = betnow
                                    gm.balance -= gm.bet
                                }
                                
                                gm.side = 0
                                gm.isChoose = false
                                gm.isGame = true
                                gm.setUpCardTimer()
                            }
                            .allowsHitTesting(gm.isChoose)
                        
                    }
                }
                
                if gm.gameOver {
                    if gm.whoWin == -1 {
                        Image(GameImg.bankerwin)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 50)
                    }
                    
                    if gm.whoWin == 0 {
                        Image(GameImg.push)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 50)
                    }
                    
                    if gm.whoWin == 1 {
                        Image(GameImg.playerwin)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 50)
                        
                    }
                }
            }
            .offset(y: -gm.size.height*0.04)
            
            if gm.isPaused {
                ZStack {
                    Color.black.opacity(0.2)
                    
                    Image(GameImg.pausebg)
                        .resizable()
                        .scaledToFit()
                        .overlay(alignment: .top) {
                            VStack(spacing: 12) {
                                Text("Pause")
                                    .font(.custom(CustomFont.black, size: 45))
                                Button {
                                    gm.isPaused = false
                                } label: {
                                    Image(GameImg.returnbtn)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: gm.size.width * 0.6)
                                        .padding(.bottom, 16)
                                }
                                Button {
                                    gm.gameStats.append(GameStats(strategy: gm.strategy, income: gm.income, outcome: gm.outcome, time: gm.count, bankerWins: gm.bankerWinsCount, pushCount: gm.pushCount, playerWins: gm.playerWinsCount))
                                    UserDefaultService.shared.saveStructs(structs: gm.gameStats, forKey: "gameStats")
                                    gm.resetToInitial()
                                    dismiss()
                                } label: {
                                    Image(GameImg.tomenu)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: gm.size.width * 0.4)
                                }
                            }
                        }
                }
            }
            if gm.isSelection {
                Selection()
                    .environmentObject(gm)
            }
            
            if gm.showDescription {
                ShortDescription(article: gm.strategy, isFromGame: true)
                    .environmentObject(gm)
            }
        }
        .onReceive(Publishers.keyboardHeight) { self.keyboardHeight = $0
        }
        .ignoresSafeArea()
        .navigationBarHidden(true)
        .preferredColorScheme(.dark)
        .onAppear {
           // bet = gm.bet
            gm.addCards()
        }
        .onTapGesture {
               
            if gm.isInitial || gm.isChoose {
                UIApplication.shared.endEditing()
                let betnow = Int(bet) ?? 0
                gm.balance += gm.bet
                if betnow > gm.balance {
                    gm.bet = 1
                    gm.balance -= 1
                    bet = "1"
                } else {
                    gm.bet = betnow
                    gm.balance -= gm.bet
                    
                    if gm.bet > 0 {
                        gm.isInitial = false
                        gm.isChoose = true
                    }
                }
            }
            
            if gm.gameOver {
                bet = ""
                gm.finalizeRound()
                if gm.balance == 0 {
                    gm.gameStats.append(GameStats(strategy: gm.strategy, income: gm.income, outcome: gm.outcome, time: gm.count, bankerWins: gm.bankerWinsCount, pushCount: gm.pushCount, playerWins: gm.playerWinsCount))
                    UserDefaultService.shared.saveStructs(structs: gm.gameStats, forKey: "gameStats")
                    
                    Timer.scheduledTimer(withTimeInterval: 1, repeats: false) { timer in
                        withAnimation {
                            gm.resetToInitial()
                            dismiss()
                        }
                    }
                 
                }
            }
        }
    }
}

#Preview {
    Gameplay()
        .environmentObject(GameLogic())
}

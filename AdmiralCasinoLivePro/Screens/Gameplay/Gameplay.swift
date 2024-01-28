//
//  Gameplay.swift
//

import SwiftUI

struct Gameplay: View {
    let size: CGSize = CGSize(width: 430, height: 932)
    @EnvironmentObject var gm: GameLogic
    @Environment(\.dismiss) var dismiss
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                Image(GameImg.tablebg)
                    .resizable()
                    .scaledToFit()
                    .scaleEffect(x: 1.13)
                    .offset(y: 20)
                
                ZStack {
                    Image(GameImg.betbg)
                        .resizable()
                        .scaledToFit()
                        .overlay {
                            HStack {
                                Text(gm.bet == 0 ? "PLACE YOUR BET" : "\(gm.bet)" )
                                    .font(.custom(CustomFont.extraBold, size: 18))
                                    .shadow(radius: 2, y: 2)
                                if gm.bet > 0 {
                                    Image(GameImg.coin)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 35)
                                        .offset(y: 4)
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
                                }
                            }
                        
                        Spacer()
                        
                        Image(GameImg.plus)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 56, height: 48)
                            .onTapGesture {
                                if gm.isInitial {
                                    withAnimation {
                                        gm.bet += 500
                                        gm.balance -= 500
                                        gm.isInitial = false
                                        gm.isChoose = true
                                    }
                                } else if gm.isChoose && gm.balance >= 500 {
                                    gm.bet += 500
                                    gm.balance -= 500
                                }
                            }
                    }
                }
                .padding(.horizontal, 18)
                
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
                            Text("STRATEGY NAME")
                            Image(Img.info)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 35, height: 35)
                                .padding(.trailing)
                        }
                        .offset(x: 30)
                    }
                   .offset(y: 4)
                Spacer()
            }
            .offset(y: 28)
            
            VStack(spacing: size.height * 0.05) {
                
                Button {
                    gm.side = 0
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
                        .frame(width: size.width * 0.7)
                        .shadow(color: .white, radius: gm.isChoose || gm.side == 0 ? 4 : 0)
                        .overlay(alignment: .top) {
                            VStack {
                                Text("BANKER")
                                    .font(.custom(CustomFont.extraBold, size: 28))
                                    .foregroundStyle(.white.opacity(gm.isInitial ? 0.5 : 1))
                                    .padding(.top)
                                HStack {
                                    ForEach(gm.bankerCards) { card in
                                            Card(isFlipped: false, needToRotate: true, image: card.image, width: 75, height: 100)
                                    }
                                }
                            }
                        }
                }
                .allowsHitTesting(gm.isChoose)
               
                
                
                Button {
                    gm.side = 1
                    gm.isChoose = false
                    gm.isGame = true
                    gm.setUpCardTimer()
                    
                } label: {
                    Image(GameImg.rect)
                        .resizable()
                        .scaledToFit()
                        .frame(width: size.width * 0.7)
                        .shadow(color: .white, radius: gm.isChoose || gm.side == 1  ? 4 : 0)
                        .overlay(alignment: .bottom) {
                            VStack {
                                
                                HStack {
                                    ForEach(gm.playerCards) { card in
                                        Card(isFlipped: false, needToRotate: true, image: card.image, width: 75, height: 100)
                                    }
                                }
                                
                                Text("PLAYER")
                                    .font(.custom(CustomFont.extraBold, size: 28))
                                    .foregroundStyle(.white.opacity(gm.isInitial ? 0.5 : 1))
                                    .padding(.bottom)
                          
                            }
                        }
                        .padding(4)
                }
                .allowsHitTesting(gm.isChoose)
            }
            .overlay {
                if gm.isChoose {
                    ZStack {
                        Image(GameImg.gradgreen)
                            .resizable()
                            .scaledToFit()
                        Text("CHOOSE YOUR SIDE")
                            .font(.custom(CustomFont.extraBold, size: 28))
                            .foregroundStyle(.white)
                            .shadow(radius: 4, y: 4)
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
            .offset(y: -size.height*0.04)
            
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
                                        .frame(width: size.width * 0.6)
                                        .padding(.bottom, 16)
                                }
                                Button {
                                    
                                    gm.gameStats.append(GameStats(strategy: 5, income: gm.income, outcome: gm.outcome, time: gm.count, bankerWins: gm.bankerWinsCount, pushCount: gm.pushCount, playerWins: gm.playerWinsCount))
                                    UserDefaultService.shared.saveStructs(structs: gm.gameStats, forKey: "gameStats")
                                    gm.resetToInitial()
                                    dismiss()
                                    
                                    
                                } label: {
                                    Image(GameImg.tomenu)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: size.width * 0.4)
                                }
                            }
                        }
                    
                    
                    
                    
                }
            }
            if gm.isSelection {
                Selection()
                    .environmentObject(gm)
            }
        }
        .ignoresSafeArea()
        .navigationBarHidden(true)
        .preferredColorScheme(.dark)
        .onAppear {
            gm.addCards()
        }
        .onTapGesture {
            if gm.gameOver {
                gm.finalizeRound()
            }
        }
    }
}

#Preview {
    Gameplay()
        .environmentObject(GameLogic())
}
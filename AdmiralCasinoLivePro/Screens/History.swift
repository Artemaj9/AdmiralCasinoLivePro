//
//  History.swift
//

import SwiftUI

struct History: View {    
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var gm: GameLogic
    
    
    var body: some View {
        ZStack {
            Background()
      
       
            if gm.gameStats.isEmpty {
                VStack(spacing: 8) {
                    Text("There is No Games")
                        .font(.custom(CustomFont.black, size: 32))
                        .foregroundStyle(.white)
                    
                    Text("Play baccarat and get session history!")
                    
                        .font(.custom(CustomFont.black, size: 18))
                        .foregroundStyle(.white.opacity(0.5))
                        .padding(.horizontal,40)
                        .multilineTextAlignment(.center)
                    
                }
            } else {
                ScrollView(showsIndicators: false) {
                    Color.clear
                        .frame(height: 110)
                    ForEach (gm.gameStats.indices) { index in
                        let game = gm.gameStats[index]
                        HistoryCell(image: game.strategy, number: index + 1, playerWinsCount: game.playerWins, bankerWinsCount: game.bankerWins, pushCount: game.pushCount, income: game.income, outcome: game.outcome, timerCount: game.time)
                    }
                    Color.clear
                        .frame(height: 50)
                }
            }
            VStack {
                Header(text: "SESSIONS \n HISTORY", fontSize: 20, size: gm.size)
                    .offset(y: 4)
                
                Spacer()
            }
            .ignoresSafeArea()
        }
        .navigationBarHidden(true)
    }
}

#Preview {
    History()
        .environmentObject(GameLogic())
}

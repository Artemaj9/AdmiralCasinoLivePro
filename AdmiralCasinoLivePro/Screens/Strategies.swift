//
//  Strategies.swift
//

import SwiftUI

struct Strategies: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var gm: GameLogic
    
    var body: some View {
        ZStack {
            Background()
            VStack {
                Header(text: "STRATEGIES", size: gm.size)
                
                ScrollView(showsIndicators: false) {
                    ForEach(0..<3) { index in
                        HStack {
                            NavigationLink {
                                StrategyDescription(article: 2*index + 1)
                            } label: {
                                Image("person\(2 * index + 1)")
                                    .resizable()
                                    .scaledToFit()
                            }
                            Color.clear
                                .frame(width: 1)
                            NavigationLink {
                                StrategyDescription(article: 2*index + 2)
                            } label: {
                                Image("person\(2*index + 2)")
                                    .resizable()
                                    .scaledToFit()
                            }
                        }
                        .padding(.bottom, 6)
                    }
                    Color.clear
                        .frame(height: 100)
                }
                .padding(16)
            }
            .ignoresSafeArea()
        }
        .preferredColorScheme(.dark)
        .navigationBarHidden(true)
    }
}

#Preview {
    Strategies()
        .environmentObject(GameLogic())
}

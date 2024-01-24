//
//  StrategyDescription.swift
//  AdmiralCasinoLivePro
//
//  Created by Artem on 24.01.2024.
//

import SwiftUI

struct StrategyDescription: View {
    
    @State var article: Int = 1
    var body: some View {
        ZStack {
            Background()
            VStack {
                Header(text: "THE BACCARAT\n MARTINGALE", fontSize: 20)
                    .offset(y: 4)
                Image("man\(article)")
                    .resizable()
                    .scaledToFit()
                    .padding(.horizontal)
                    .padding(.top, 8)
                Spacer()
            }
            .ignoresSafeArea()
        }
    }
}

#Preview {
    StrategyDescription()
}

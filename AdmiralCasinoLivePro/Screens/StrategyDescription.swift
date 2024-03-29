//
//  StrategyDescription.swift
//

import SwiftUI

struct StrategyDescription: View {
    @EnvironmentObject var gm: GameLogic
    
    let article: Int
    var body: some View {
        ZStack {
            Background()
            VStack {
                Header(text: articles[article-1].title , fontSize: 20, size: gm.size)
                    .offset(y: 4)
                Image("man\(article)")
                    .resizable()
                    .scaledToFit()
                    .padding(.horizontal)
                    .padding(.top, 8)
                
                ScrollView(showsIndicators: false) {
                    VStack(alignment: .leading) {
                        
                        Text(articles[article-1].description)
                            .font(.custom(CustomFont.medium, size: 18))
                            .foregroundStyle(.white)
                        
                        Text("Key Aspects:")
                            .font(.custom(CustomFont.bold, size: 24))
                            .foregroundStyle(.white)
                            .padding(.vertical, 4)
                        
                        ForEach(0..<articles[article-1].keyAspects.count) { i in
                            HStack(alignment: .top) {
                                Text("\(i+1).")
                                Text(articles[article-1].keyAspects[i])
                            }
                            .font(.custom(CustomFont.medium, size: 18))
                            .foregroundStyle(.white)
                        }
                        Text("Conclusion:")
                            .font(.custom(CustomFont.bold, size: 24))
                            .foregroundStyle(.white)
                            .padding(.vertical, 4)
                        Text(articles[article - 1].conclusion)
                            .font(.custom(CustomFont.medium, size: 18))
                            .foregroundStyle(.white)
                    }
                    Color.clear
                        .frame(height: 100)
                    }
                    .padding()
            }
            .ignoresSafeArea()
        }
        .preferredColorScheme(.dark)
        .navigationBarHidden(true)
    }
}

#Preview {
    StrategyDescription(article: 2)
        .environmentObject(GameLogic())
}

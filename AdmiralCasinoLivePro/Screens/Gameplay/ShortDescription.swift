//
//  ShortDecription.swift
//


import SwiftUI

struct ShortDescription: View {
    
    let article: Int
    @Environment(\.dismiss) var dismiss
    var isFromGame = false
    
    @EnvironmentObject var gm: GameLogic
    
    var body: some View {
        ZStack {
            Background()
            VStack {
                Header(text: articles[article-1].title , fontSize: 20, size: gm.size, isFromGame: isFromGame)
                    .offset(y: gm.size.width < 380 ?  4 : 16)
                Image("man\(article)")
                    .resizable()
                    .scaledToFit()
                    .padding(.horizontal)
                    .padding(.top, 8)
                
                ScrollView(showsIndicators: false) {
                    VStack(alignment: .leading) {
                        
                            Text(shortDescription[article-1])
                                .font(.custom(CustomFont.medium, size: 18))
                                .foregroundStyle(.white)
                                .padding(.horizontal, 8)
                            
                            VStack(alignment: .center)
                            {
                                if !isFromGame {
                                
                                NavigationLink {
                                    StrategyDescription(article: article)
                                } label: {
                                    Image(GameImg.more)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: gm.size.width * 0.6)
                                        .padding(.vertical)
                                }
                                    if !isFromGame {
                                        Button {
                                            dismiss()
                                            gm.isSelection = false
                                            gm.isInitial = true
                                            gm.setupTimer()
                                        } label: {
                                            Image(GameImg.play)
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: gm.size.width * 0.8)
                                        }
                                    }
                            } else {
                                Button {
                                    gm.showDescription = false
                                    gm.isPaused = false
                                } label: {
                                    Image(Img.backbtn)
                                        .resizable()
                                        .scaledToFit()
                                        .padding()
                                        .frame(width: gm.size.width * 0.4)
                                        .frame(width: gm.size.width*0.9, alignment: .center)
                                }
                            }
                    }
                            .padding()

                    }
                    Color.clear
                        .frame(width: 20, height: 80)
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
    ShortDescription(article: 3)
        .environmentObject(GameLogic())
}

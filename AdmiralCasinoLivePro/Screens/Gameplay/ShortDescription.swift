//
//  ShortDecription.swift
//


import SwiftUI

struct ShortDescription: View {
    
    let article: Int
    @Environment(\.dismiss) var dismiss
    var isFromGame = false
    
    @EnvironmentObject var gm: GameLogic
  //  @State var showMore = false
    
    var body: some View {
        ZStack {
            Background()
            VStack {
                Header(text: articles[article-1].title , fontSize: 20)
                    .offset(y: 4)
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
                            
                            VStack(alignment: .center)
                            {
                                if !isFromGame {
                                
                                NavigationLink {
                                    StrategyDescription(article: article)
                                } label: {
                                    Image(GameImg.more)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: gm.size.width * 0.5)
                                        .padding(.vertical)
                                }
                                    if !isFromGame {
                                        Button {
                                            dismiss()
                                            gm.isSelection = false
                                            gm.isInitial = true
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
                                        .frame(width: gm.size.width, alignment: .center)
                                }
                            }
                    }
                            .padding()
                            .frame(width: gm.size.width)
                        
//                        Text("Key Aspects:")
//                            .font(.custom(CustomFont.bold, size: 24))
//                            .foregroundStyle(.white)
//                            .padding(.vertical, 4)
//                        
//                        ForEach(0..<articles[article-1].keyAspects.count) { i in
//                            HStack(alignment: .top) {
//                                Text("\(i+1).")
//                                Text(articles[article-1].keyAspects[i])
//                            }
//                            .font(.custom(CustomFont.medium, size: 18))
//                            .foregroundStyle(.white)
//                        }
//                        Text("Conclusion:")
//                            .font(.custom(CustomFont.bold, size: 24))
//                            .foregroundStyle(.white)
//                            .padding(.vertical, 4)
//                        Text(articles[article - 1].conclusion)
//                            .font(.custom(CustomFont.medium, size: 18))
//                            .foregroundStyle(.white)
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
    ShortDescription(article: 3)
        .environmentObject(GameLogic())
}

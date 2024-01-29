//
//  Menu.swift
//

import SwiftUI

struct Menu: View {
    @State var size: CGSize = .zero
    @EnvironmentObject var gm: GameLogic
    
    var body: some View {
        NavigationView {
            ZStack {
                Background()
                
                VStack(spacing: gm.size.width < 380 ? 8 : 20) {
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Hello!")
                                .font(.custom(CustomFont.extraBold, size: 33))
                            
                            Text("Ready For New Strategies?")
                                .font(.custom(CustomFont.extraBold, size: 18))
                        }
                        .foregroundStyle(.white)
                        .padding(.top)
                        
                        Spacer()
                        
                        NavigationLink {
                            Info()
                                .environmentObject(gm)
                        } label: {
                            Image(Img.info)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 45, height: 45)
                        }
                    }
                    .padding([.horizontal, .top])
                    
                    Image(Img.menulogo)
                        .resizable()
                        .scaledToFit()
                        .padding(.horizontal, gm.size.width > 380 ? 16 : 20)
                        .frame(width: gm.size.width > 380 ?  gm.size.width*0.9 :  gm.size.width*0.8)
                        .overlay(alignment: .bottom) {
                            NavigationLink {
                                Gameplay()
                                    .environmentObject(gm)
                            } label: {
                                Image(Img.play)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 72, height: 72)
                                    .offset(y: 16)
                            }
                         
                        }
                    
                    HStack {
                        Text("Knowledge Base")
                            .font(.custom(CustomFont.extraBold, size: 21))
                            .foregroundColor(.white)
                        
                        Spacer()
                    }
                    .padding([.horizontal], 18)
                    .padding(.top)
                    
                    HStack {
                        NavigationLink {
                            History()
                                .environmentObject(gm)
                        } label: {
                            Image(Img.history)
                                .resizable()
                                .scaledToFit()
                                .frame(width: gm.size.width*0.42, height: gm.size.width > 380 ? gm.size.height * 0.3 : gm.size.height * 0.27)
                                .padding(.trailing)
                        }

                        NavigationLink {
                            Strategies()
                                .environmentObject(gm)
                        } label: {
                            Image(Img.strategies)
                                .resizable()
                                .scaledToFit()
                                .frame(width: gm.size.width*0.42, height: gm.size.width > 380 ? gm.size.height * 0.3 : gm.size.height * 0.27)
                        }
                    }
                    .padding(gm.size.width > 380 ? 18 : 10)
                    
                    HStack {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(historyReflection)
                            .frame(width: gm.size.width*0.42, height: gm.size.height*0.07)
                            .opacity(0.3)
                            .padding(.trailing)
                        
                        RoundedRectangle(cornerRadius: 10)
                            .fill(stratReflection)
                            .frame(width: gm.size.width*0.42, height: gm.size.height*0.07)
                            .opacity(0.2)
                    }
                }
            }
            .preferredColorScheme(.dark)
            .onAppear {
                gm.gameStats = UserDefaultService.shared.getStructs(forKey: "gameStats") ?? []
            }
        }
        .navigationViewStyle(.stack)
        .navigationBarHidden(true)
    }
}

#Preview {
    Menu()
        .environmentObject(GameLogic())
}

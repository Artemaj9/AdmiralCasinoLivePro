//
//  Gameplay.swift
//

import SwiftUI

struct Gameplay: View {
    var body: some View {
        ZStack {
       
            VStack(spacing: 0) {
             
                
                Image(GameImg.tablebg)
                    .resizable()
                    .scaledToFit()
                    .scaleEffect(x: 1.13)
                
                ZStack {
                    Image(GameImg.betbg)
                        .resizable()
                        .scaledToFit()
                        .overlay {
                            Text("PLACE YOUR BET")
                                .font(.custom(CustomFont.extraBold, size: 18))
                                .shadow(radius: 2, y: 2)
                        }
                    
                    HStack {
                        Image(GameImg.minus)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 56, height: 48)
                        
                        
                        Spacer()
                        
                        Image(GameImg.plus)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 56, height: 48)
                    }
                }
                .padding(.horizontal, 18)
                
                HStack(spacing: 0) {
                    Image(GameImg.playerslot)
                        .resizable()
                        .scaledToFit()
                        .overlay {
                            Text("0%")
                                .font(.custom(CustomFont.extraBold, size: 18))
                                .foregroundStyle(Pallete.lightgreen)
                        }
                    
                    Image(GameImg.pushslot)
                        .resizable()
                        .scaledToFit()
                        .overlay {
                            Text("0%")
                                .font(.custom(CustomFont.extraBold, size: 18))
                                .foregroundStyle(Pallete.lightblue)
                        }
                    
                    Image(GameImg.bankerslot)
                        .resizable()
                        .scaledToFit()
                        .overlay {
                            Text("0%")
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
                                    Text("9500")
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
                                        Text("-9500")
                                            .font(.custom(CustomFont.medium, size: 14))
                                            .foregroundStyle(Pallete.outcome)
                                            .offset(x: 8, y: -4)
                                    }
                                    .frame(height: 40)
                              
                                Image(GameImg.income)
                                    .resizable()
                                    .scaledToFit()
                                    .overlay {
                                        Text("+9500")
                                            .font(.custom(CustomFont.medium, size: 14))
                                            .foregroundStyle(Pallete.income)
                                            .offset(x: 8, y: -4)
                                    }
                                    .frame(height: 40)
                            }
                        }
                        Image(GameImg.burger)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 40, height: 40)
                            .padding(.trailing, 8)
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
        }
        .ignoresSafeArea()
        .navigationBarHidden(true)
        .preferredColorScheme(.dark)
    }
}

#Preview {
    Gameplay()
}

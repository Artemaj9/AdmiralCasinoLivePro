//
//  HistoryCell.swift
//

import SwiftUI

struct HistoryCell: View {
    let image: Int
    let number: Int
    let playerWinsCount: Int
    let bankerWinsCount: Int
    let pushCount: Int
    let income: Int
    let outcome: Int
    let timerCount: Int
    
    var body: some View {
        ZStack {
          //  Background()
            HStack(spacing: 0) {
                Image("person\(image)")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 182)
                    .scaleEffect(1.1)
                    .zIndex(2)
                ZStack {
                    Image(Img.statbg)
                        .resizable()
                        .scaledToFit()
                    
                    VStack {
                        HStack {
                            Text("SESSION \(number)")
                                .font(.custom(CustomFont.semiBold, size: 18))
                                .foregroundStyle(.white)
                                .shadow(color: Color("sessionShadow"), radius: 2, y: 2)
                            Spacer()
                            Text(timerCount.secToTime())
                                .font(.custom(CustomFont.semiBold, size: 18))
                                .foregroundStyle(Pallete.timergray)
                        }
                        .padding()
                        
                        HStack {
                            Image(Img.player)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 66, height: 78)
                                .overlay(alignment: .bottom) {
                                    Text("\(playerWinsCount)")
                                        .font(.custom(CustomFont.semiBold, size: 15))
                                        .foregroundStyle(Pallete.yellowstat)
                                        .offset(y: -8)
                                }
                            
                            Image(Img.banker)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 66, height: 78)
                                .overlay(alignment: .bottom) {
                                    Text("\(bankerWinsCount)")
                                        .font(.custom(CustomFont.semiBold, size: 15))
                                        .foregroundStyle(Pallete.yellowstat)
                                        .offset(y: -8)
                                }
                            Image(Img.push)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 66, height: 78)
                                .overlay(alignment: .bottom) {
                                    Text("\(pushCount)")
                                        .font(.custom(CustomFont.semiBold, size: 15))
                                        .foregroundStyle(Pallete.yellowstat)
                                        .offset(y: -8)
                                }
                        }
                        
                        HStack {
                            Image(Img.income)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 98, height: 30)
                                .overlay(alignment: .top) {
                                    Text("\(income)")
                                        .font(.custom(CustomFont.regular, size: 14))
                                        .foregroundStyle(Pallete.income)
                                        .offset(x: 12)
                                }
                            Image(Img.outcome)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 98, height: 30)
                                .overlay(alignment: .top) {
                                    Text("-\(outcome)")
                                        .font(.custom(CustomFont.regular, size: 14))
                                        .foregroundStyle(Pallete.outcome)
                                        .offset(x: 12)
                                }
                            
                        }
                    }
                    .offset(y: -8)
                    .padding()
                    
                }
            }
            .padding(.horizontal)
        }
    }
}

#Preview {
    HistoryCell(image: 3, number: 1, playerWinsCount: 5, bankerWinsCount: 4, pushCount: 7, income: 700, outcome: 200, timerCount: 357)
}

//
//  TextField.swift
//

import SwiftUI

struct DelusionTF: View {
    
    @State var isSelected = false
    @State var opacity: CGFloat = 0
    @Binding var text: String
    @FocusState private var isFocused: Bool
    @EnvironmentObject var gm: GameLogic
    var fontSize: CGFloat = 27
    
    var body: some View {
    
            VStack {
                if #available(iOS 16.0, *) {
                    HStack {
                        TextField("", text: $text)
                            .scrollContentBackground(.hidden)
                            .font(.custom(CustomFont.extraBold, size: 32))
                            .focused($isFocused)
                            .padding(.horizontal)
                            .autocorrectionDisabled()
                            .multilineTextAlignment(.center)
                            .keyboardType(.numberPad)
//                            .onSubmit {
//                                gm.balance += gm.bet
//                                gm.bet = Int(text) ?? 0
//                                if gm.balance >= gm.bet {
//                                    gm.balance -= gm.bet
//                                } else {
//                                    gm.balance = 0
//                                    text = ""
//                                }
//                            }
                            .frame(width: gm.size.width*0.4)
                        Image(GameImg.coin)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 35)
                            .offset(y: 4)
                            .offset(x: -24)
                    }
                } else {
                    HStack {
                        TextField("", text: $text)
                            .keyboardType(.numberPad)
                            .font(.custom(CustomFont.extraBold, size: 32))
                            .focused($isFocused)
                        // .padding(.horizontal, 32)
                            .padding(.horizontal)
                            .padding(.vertical, 8)
                        // .foregroundColor(Pallete.starYellow)
                            .autocorrectionDisabled()
                            .multilineTextAlignment(.center)
                            
//                            .onSubmit {
//                                gm.balance += gm.bet
//                                gm.bet = Int(text) ?? 0
//                                if gm.balance >= gm.bet {
//                                    gm.balance -= gm.bet
//                                } else {
//                                    gm.balance = 0
//                                    text = ""
//                                }
//                            }
                            .frame(width: gm.size.width*0.4)
                        Image(GameImg.coin)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 35)
                            .offset(y: 4)
                            .offset(x: -24)
                    }
                }
            }
            .padding(.top, 4)
        }
    }


struct DelusionTF_Previews: PreviewProvider {
    static var previews: some View {
        DelusionTF(text: .constant(""))
    }
}

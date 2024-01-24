//
//  Header.swift
//

import SwiftUI

struct Header: View {
    var body: some View {
        ZStack(alignment: .bottom) {
            Image(Img.header)
                .resizable()
                .scaledToFill()
                .frame(width: 394, height: 109)
                .overlay(alignment: .bottom) {
                    Text("INFO")
                        .font(.custom(CustomFont.black, size: 27))
                        .foregroundStyle(.white)
                        .padding(.bottom)
                }
            HStack {
                Image(
            }
            
        }
    }
}

#Preview {
    Header()
}

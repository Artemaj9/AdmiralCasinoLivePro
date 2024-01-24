//
//  History.swift
//

import SwiftUI

struct History: View {    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            Background()
            VStack {
                Header(text: "SESSIONS \n HISTORY", fontSize: 20)
                    .offset(y: 4)
                
                Spacer()
            }
            .ignoresSafeArea()
            
            VStack(spacing: 8) {
                Text("There is No Games")
                    .font(.custom(CustomFont.black, size: 32))
                    .foregroundStyle(.white)
                
                Text("Play baccarat and get session history!")
                  
                    .font(.custom(CustomFont.black, size: 18))
                    .foregroundStyle(.white.opacity(0.5))
                    .padding(.horizontal,40)
                    .multilineTextAlignment(.center)
                
            }
        }
        .navigationBarHidden(true)
    }
}

#Preview {
    History()
}

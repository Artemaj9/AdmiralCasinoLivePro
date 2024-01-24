//
//  Colors.swift
//

import SwiftUI


//LinearGradient(stops: [
//    Gradient.Stop(color: .white, location: 0.45),
//    Gradient.Stop(color: .black, location: 0.55),
//], startPoint: .top, endPoint: .bottom)


let historyReflection  = LinearGradient(
    colors: [
        Color("historygrad"),
        Color("historygrad").opacity(0)
    ],
    startPoint: .top,
    endPoint: .bottom
)

let stratReflection  = LinearGradient(
    colors: [
        Color("stratgrad"),
        Color("stratgrad").opacity(0)
    ],
    startPoint: .top,
    endPoint: .bottom
)

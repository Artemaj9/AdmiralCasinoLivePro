//
//  Font+Ext.swift
//


import Foundation
import SwiftUI

// Добавляем кастомные шрифты для удобного использования

enum CustomFont: String {
    case black = "Inter-Black"
    case extraBold = "Inter-ExtraBold"
    case bold = "Inter-Bold"
    case semiBold = "Inter-SemiBold"
    case medium = "Inter-Medium"
    case regular = "Inter-Regular"
    
    
    case extraLight = "Montserrat-ExtraLight"
    case light = "Montserrat-Light"
    case thin = "Montserrat-Thin"
}

extension Font {
    static func custom(_ font: CustomFont, size: CGFloat) -> SwiftUI.Font {
        SwiftUI.Font.custom(font.rawValue, size: size)
    }
}

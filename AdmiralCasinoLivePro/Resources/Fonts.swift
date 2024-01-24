//
//  Font+Ext.swift
//

import SwiftUI

enum CustomFont: String {
    case black = "Inter-Black"
    case extraBold = "Inter-ExtraBold"
    case bold = "Inter-Bold"
    case semiBold = "Inter-SemiBold"
    case medium = "Inter-Medium"
    case regular = "Inter-Regular"
}

extension Font {
    static func custom(_ font: CustomFont, size: CGFloat) -> SwiftUI.Font {
        SwiftUI.Font.custom(font.rawValue, size: size)
    }
}

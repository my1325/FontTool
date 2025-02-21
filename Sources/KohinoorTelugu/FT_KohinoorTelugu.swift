//
//  File.swift
//  FontTool
//
//  Created by mayong on 2024/11/27.
//

import Foundation

#if canImport(CustomFonts)
import CustomFonts
#endif

public enum FT_KohinoorTeluguFonts: String {
    case ft_regular
    case ft_medium
    case ft_light
}

extension FT_KohinoorTeluguFonts: FT_CustomFontCompatible {
    public var ft_family: String {
        "Kohinoor Telugu"
    }
}

#if canImport(UIKit)
import UIKit

public extension UIFont {
    @MainActor static let ft_kohinoorTelugu: FT_CustomUIFontTools<FT_KohinoorTeluguFonts> = .init()
}
#endif

#if canImport(SwiftUI)
import SwiftUI

public extension Font {
    @MainActor static let ft_kohinoorTelugu: FT_CustomFontTools<FT_KohinoorTeluguFonts> = .init()
}
#endif

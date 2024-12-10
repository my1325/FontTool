//
//  File.swift
//  FontTool
//
//  Created by mayong on 2024/11/25.
//

import Foundation

#if canImport(CustomFonts)
import CustomFonts
#endif

public enum FT_AvenirFonts: String {
    case ft_black
    case ft_black_oblique
    case ft_book
    case ft_book_oblique
    case ft_heavy
    case ft_heavy_oblique
    case ft_light
    case ft_light_oblique
    case ft_medium
    case ft_medium_oblique
    case ft_oblique
    case ft_roman
}

extension FT_AvenirFonts: FT_CustomFontCompatible {
    public var ft_family: String {
        "Avenir"
    }
}

#if canImport(UIKit)
import UIKit

public extension UIFont {
    @MainActor static let ft_avenir: FT_CustomUIFontTools<FT_AvenirFonts> = .init()
}
#endif

#if canImport(SwiftUI)
import SwiftUI

public extension Font {
    @MainActor static let ft_avenir: FT_CustomFontTools<FT_AvenirFonts> = .init()
}
#endif

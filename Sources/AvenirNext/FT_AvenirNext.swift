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

public enum FT_AvenirNextFonts: String {
    case ft_regular
    case ft_italic
    case ft_ultra_light
    case ft_ultra_light_italic
    case ft_medium
    case ft_medium_italic
    case ft_demi_bold
    case ft_demi_bold_italic
    case ft_bold
    case ft_bold_italic
    case ft_heavy
    case ft_heavy_italic
}

extension FT_AvenirNextFonts: FT_CustomFontCompatible {
    public var ft_family: String {
        "Avenir Next"
    }
}

#if canImport(UIKit)
import UIKit

public extension UIFont {
    @MainActor static let ft_avenirNext: FT_CustomUIFontTools<FT_AvenirNextFonts> = .init()
}
#endif

#if canImport(SwiftUI)
import SwiftUI

public extension Font {
    @MainActor static let ft_avenirNext: FT_CustomFontTools<FT_AvenirNextFonts> = .init()
}
#endif

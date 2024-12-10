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

public enum FT_OutfitFonts {
    case ft_black
    case ft_bold
    case ft_extra_bold
    case ft_extra_light
    case ft_light
    case ft_medium
    case ft_regular
    case ft_semi_bold

    public enum FT_ThinFonts: String {
        case ft_default = "ft_"
        case ft_regular
        case ft_extra_light
        case ft_light
        case ft_medium
        case ft_semi_bold
        case ft_bold
        case ft_extra_bold
        case ft_black

        var ft_rawName: String {
            rawValue.components(separatedBy: "_")
                .filter { !$0.isEmpty && $0 != "ft" }
                .map(\.capitalized)
                .joined()
        }
    }

    case ft_thin(FT_ThinFonts)
}

extension FT_OutfitFonts: FT_CustomFontCompatible {
    public var ft_name: String {
        switch self {
        case .ft_black: "Outfit-Black"
        case .ft_bold: "Outfit-Bold"
        case .ft_extra_bold: "Outfit-ExtraBold"
        case .ft_extra_light: "Outfit-ExtraLight"
        case .ft_light: "Outfit-Light"
        case .ft_medium: "Outfit-Medium"
        case .ft_regular: "Outfit-Regular"
        case .ft_semi_bold: "Outfit-SemiBold"
        case let .ft_thin(ft_thinFont): "Outfit-Thin_\(ft_thinFont.ft_rawName)"
        }
    }

    public var ft_fontPath: String {
        switch self {
        case .ft_thin: "Outfit-VariableFont_wght.ttf"
        default: "\(ft_name).ttf"
        }
    }

    public var ft_family: String {
        "Outfit"
    }

    public func ft_registerFont() {
        guard let ft_fontURL = Bundle.module.url(forResource: ft_fontPath, withExtension: "") else {
            fatalError("ft font \(ft_name) not found")
        }

        var ft_error: Unmanaged<CFError>?
        let ft_registered = CTFontManagerRegisterFontsForURL(ft_fontURL as CFURL, .process, &ft_error)
        if !ft_registered {
            print("ft font \(ft_name) registration failed")
        }
    }
}

#if canImport(UIKit)
import UIKit

public extension UIFont {
    @MainActor static let ft_outfit: FT_CustomUIFontTools<FT_OutfitFonts> = .init()
}
#endif

#if canImport(SwiftUI)
import SwiftUI

public extension Font {
    @MainActor static let ft_outfit: FT_CustomFontTools<FT_OutfitFonts> = .init()
}
#endif

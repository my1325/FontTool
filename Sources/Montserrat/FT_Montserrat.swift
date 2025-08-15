//
//  FT_Montserrat.swift
//  FontTool
//
//  Created by mayong on 2025/8/15.
//

import Foundation

#if canImport(CustomFonts)
import CustomFonts
#endif
///Users/mayong/Desktop/My/Fonts/Sources/Montserrat/Fonts/Montserrat-Black.ttf
///Users/mayong/Desktop/My/Fonts/Sources/Montserrat/Fonts/Montserrat-BlackItalic.ttf
///Users/mayong/Desktop/My/Fonts/Sources/Montserrat/Fonts/Montserrat-Bold.ttf
///Users/mayong/Desktop/My/Fonts/Sources/Montserrat/Fonts/Montserrat-BoldItalic.ttf
///Users/mayong/Desktop/My/Fonts/Sources/Montserrat/Fonts/Montserrat-ExtraBold.ttf
///Users/mayong/Desktop/My/Fonts/Sources/Montserrat/Fonts/Montserrat-ExtraBoldItalic.ttf
///Users/mayong/Desktop/My/Fonts/Sources/Montserrat/Fonts/Montserrat-ExtraLight.ttf
///Users/mayong/Desktop/My/Fonts/Sources/Montserrat/Fonts/Montserrat-ExtraLightItalic.ttf
///Users/mayong/Desktop/My/Fonts/Sources/Montserrat/Fonts/Montserrat-Italic.ttf
///Users/mayong/Desktop/My/Fonts/Sources/Montserrat/Fonts/Montserrat-Light.ttf
///Users/mayong/Desktop/My/Fonts/Sources/Montserrat/Fonts/Montserrat-LightItalic.ttf
///Users/mayong/Desktop/My/Fonts/Sources/Montserrat/Fonts/Montserrat-Medium.ttf
///Users/mayong/Desktop/My/Fonts/Sources/Montserrat/Fonts/Montserrat-MediumItalic.ttf
///Users/mayong/Desktop/My/Fonts/Sources/Montserrat/Fonts/Montserrat-Regular.ttf
///Users/mayong/Desktop/My/Fonts/Sources/Montserrat/Fonts/Montserrat-SemiBold.ttf
///Users/mayong/Desktop/My/Fonts/Sources/Montserrat/Fonts/Montserrat-SemiBoldItalic.ttf
///Users/mayong/Desktop/My/Fonts/Sources/Montserrat/Fonts/Montserrat-Thin.ttf
///Users/mayong/Desktop/My/Fonts/Sources/Montserrat/Fonts/Montserrat-ThinItalic.ttf
public enum FT_MontserratFonts: String {
    case ft_black
    case ft_black_italic
    case ft_bold
    case ft_bold_italic
    case ft_extra_bold
    case ft_extra_bold_italic
    case ft_extra_light
    case ft_extra_light_italic
    case ft_italic
    case ft_light
    case ft_light_italic
    case ft_medium
    case ft_medium_italic
    case ft_semi_bold
    case ft_semi_bold_italic
    case ft_thin
    case ft_thin_italic
}


extension FT_BundleToken {
    public static var ft_montserratBundle: Bundle {
#if SWIFT_PACKAGE
        return .module
#else
        return FT_BundleToken.ft_bundle
#endif
    }
}

extension FT_MontserratFonts: FT_CustomFontCompatible {
//    public var ft_name: String {
//        <#code#>
//    }
    
    public var ft_family: String {
        "Montserrat"
    }

    public func ft_registerFont() {
        guard let ft_fontURL = FT_BundleToken.ft_montserratBundle.url(forResource: ft_name, withExtension: "ttf") else {
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
    @MainActor static let ft_montserrat: FT_CustomUIFontTools<FT_MontserratFonts> = .init()
}
#endif

#if canImport(SwiftUI)
import SwiftUI

public extension Font {
    @MainActor static let ft_montserrat: FT_CustomFontTools<FT_MontserratFonts> = .init()
}
#endif

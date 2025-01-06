//
//  File.swift
//  FontTool
//
//  Created by mayong on 2025/1/6.
//

import Foundation
#if canImport(CustomFonts)
import CustomFonts
#endif

public enum FT_CaustenFonts: String {
    case ft_regular
    case ft_medium
    case ft_bold
    case ft_bold_oblique
}

extension FT_BundleToken {
    public static var ft_caustenBundle: Bundle {
#if SWIFT_PACKAGE
        return .module
#else
        return FT_BundleToken.ft_bundle
#endif
    }
}

extension FT_CaustenFonts: FT_CustomFontCompatible {
    public var ft_family: String {
        "Causten"
    }
    
    public func ft_registerFont() {
        guard let ft_fontURL = FT_BundleToken.ft_caustenBundle.url(forResource: ft_name, withExtension: "otf") else {
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
    @MainActor static let ft_causten: FT_CustomUIFontTools<FT_CaustenFonts> = .init()
}
#endif

#if canImport(SwiftUI)
import SwiftUI

public extension Font {
    @MainActor static let ft_causten: FT_CustomFontTools<FT_CaustenFonts> = .init()
}
#endif


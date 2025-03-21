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

public enum FT_RammettoOneFonts: String {
    case ft_regular
}

extension FT_BundleToken {
    public static var ft_rammettoOneBundle: Bundle {
#if SWIFT_PACKAGE
        return .module
#else
        return FT_BundleToken.ft_bundle
#endif
    }
}

extension FT_RammettoOneFonts: FT_CustomFontCompatible {
    public var ft_family: String {
        "Rammetto One"
    }
    
    public func ft_registerFont() {
        guard let ft_fontURL = FT_BundleToken.ft_rammettoOneBundle.url(forResource: ft_name, withExtension: "ttf") else {
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
    @MainActor static let ft_rammettoOne: FT_CustomUIFontTools<FT_RammettoOneFonts> = .init()
}
#endif

#if canImport(SwiftUI)
import SwiftUI

public extension Font {
    @MainActor static let ft_rammettoOne: FT_CustomFontTools<FT_RammettoOneFonts> = .init()
}
#endif

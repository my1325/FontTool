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

public enum FT_PoppinsFonts: String {
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
    case ft_regular
    case ft_semi_bold
    case ft_semi_bold_italic
    case ft_thin
    case ft_thin_italic
}

extension FT_BundleToken {
    public static var ft_poppinsBundle: Bundle {
#if SWIFT_PACKAGE
        return .module
#else
        return FT_BundleToken.ft_bundle
#endif
    }
}

extension FT_PoppinsFonts: FT_CustomFontCompatible {
    public var ft_family: String {
        "Poppins"
    }
    
    public func ft_registerFont() {
        guard let ft_fontURL = FT_BundleToken.ft_poppinsBundle.url(forResource: ft_name, withExtension: "otf") else {
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
    @MainActor static let ft_poppinsNext: FT_CustomUIFontTools<FT_PoppinsFonts> = .init()
}
#endif

#if canImport(SwiftUI)
import SwiftUI

public extension Font {
    @MainActor static let ft_poppinsNext: FT_CustomFontTools<FT_PoppinsFonts> = .init()
}
#endif

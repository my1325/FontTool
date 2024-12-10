//
//  File.swift
//  FontTool
//
//  Created by mayong on 2024/11/25.
//

import Foundation

public protocol FT_CustomFontCompatible {
    var ft_family: String { get }

    var ft_name: String { get }
    
    func ft_registerFont()
}

public extension FT_CustomFontCompatible {
    func ft_registerFont() {
        fatalError("ft font \(ft_name) is not registered")
    }
    
    fileprivate func ft_registerIfNeeded() {
        guard !UIFont.fontNames(forFamilyName: ft_family).contains(ft_name) else {
            return
        }
        
        ft_registerFont()
    }
}

public extension FT_CustomFontCompatible where Self: RawRepresentable, Self.RawValue == String {
    var ft_name: String {
        ft_camelCased
            .replacingOccurrences(
                of: "Ft",
                with: String(
                    format: "%@-",
                    ft_family.replacingOccurrences(of: " ", with: "")
                )
            )
    }

    var ft_camelCased: String {
        rawValue.components(separatedBy: "_")
            .filter { !$0.isEmpty }
            .map(\.capitalized)
            .joined()
    }
}

#if canImport(UIKit)
import UIKit

public struct FT_CustomUIFontTools<FT_Font> where FT_Font: FT_CustomFontCompatible {
    public init() {}

    public func ft_font(
        _ ft_fontType: FT_Font,
        ft_size: CGFloat
    ) -> UIFont {
        ft_fontType.ft_registerIfNeeded()
        return UIFont(
            name: ft_fontType.ft_name,
            size: ft_size
        )!
    }
}

#endif

#if canImport(SwiftUI)
import SwiftUI

public struct FT_CustomFontTools<FT_Font> where FT_Font: FT_CustomFontCompatible {
    public init() {}

    public func ft_font(
        _ ft_fontType: FT_Font,
        ft_size: CGFloat
    ) -> Font {
        ft_fontType.ft_registerIfNeeded()
        return Font.custom(
            ft_fontType.ft_name,
            size: ft_size
        )
    }
}

#endif

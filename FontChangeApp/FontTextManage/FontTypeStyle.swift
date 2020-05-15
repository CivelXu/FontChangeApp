//
//  FontTextStyle.swift
//  FontChangeApp
//
//  Created by Civel Xu on 2020/5/13.
//  Copyright © 2020 Civel Xu. All rights reserved.
//

import UIKit

public enum FontTypeSizes: Int {
    case xSmall = 1
    case small = 2
    case medium = 3
    case large = 4
    case xLarge = 5
    case xxLarge = 6
    case xxxLarge = 7
}

public enum FontTypeStyle {
    case largeTitle
    case title1
    case title2
    case title3
    case headline
    case body
    case callout
    case subhead
    case footnote
    case caption1
    case caption2
}

let fontSizeTable: [FontTypeStyle : [FontTypeSizes : CGFloat]] = {
    return [
        .largeTitle: [
            .xSmall: 31,
            .small: 32,
            .medium: 33,
            .large: 34,
            .xLarge: 36,
            .xxLarge: 38,
            .xxxLarge: 40
        ],
        .title1: [
            .xSmall: 25,
            .small: 26,
            .medium: 27,
            .large: 28,
            .xLarge: 30,
            .xxLarge: 32,
            .xxxLarge: 34
        ],
        .title2: [
            .xSmall: 19,
            .small: 26,
            .medium: 27,
            .large: 22,
            .xLarge: 24,
            .xxLarge: 26,
            .xxxLarge: 34
        ],
        .title3: [
            .xSmall: 17,
            .small: 20,
            .medium: 21,
            .large: 20,
            .xLarge: 22,
            .xxLarge: 24,
            .xxxLarge: 28
        ],
        .headline: [
            .xSmall: 14,
            .small: 15,
            .medium: 16,
            .large: 17,
            .xLarge: 19,
            .xxLarge: 21,
            .xxxLarge: 21
        ],
        .body: [
            .xSmall: 14,
            .small: 15,
            .medium: 16,
            .large: 17,
            .xLarge: 19,
            .xxLarge: 21,
            .xxxLarge: 23
        ],
        .callout: [
            .xSmall: 13,
            .small: 14,
            .medium: 15,
            .large: 16,
            .xLarge: 18,
            .xxLarge: 20,
            .xxxLarge: 22
        ],
        .subhead: [
            .xSmall: 12,
            .small: 13,
            .medium: 14,
            .large: 15,
            .xLarge: 17,
            .xxLarge: 19,
            .xxxLarge: 21
        ],
        .footnote: [
            .xSmall: 12,
            .small: 12,
            .medium: 12,
            .large: 13,
            .xLarge: 15,
            .xxLarge: 17,
            .xxxLarge: 19
        ],
        .caption1: [
            .xSmall: 11,
            .small: 11,
            .medium: 11,
            .large: 12,
            .xLarge: 14,
            .xxLarge: 16,
            .xxxLarge: 18
        ],
        .caption2: [
            .xSmall: 11,
            .small: 11,
            .medium: 11,
            .large: 11,
            .xLarge: 13,
            .xxLarge: 15,
            .xxxLarge: 17
        ],
    ]
}()

extension FontTypeStyle {
    func fontSize() -> CGFloat {
        let style = FontTextManage.fontSizeStyle
        guard let dict = fontSizeTable[self], let value = dict[style] else {
            return 14
        }
        return value
    }
}

extension UIFont {

    static func applyFont(style: FontTypeStyle, weight: Weight = .regular) -> UIFont {
        return .systemFont(ofSize: style.fontSize(), weight: weight)
    }
    
    static func applyFont(name: String, style: FontTypeStyle) -> UIFont? {
        return UIFont.init(name: name, size: style.fontSize())
    }

}

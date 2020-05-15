//
//  FontTextStyle.swift
//  FontChangeApp
//
//  Created by Civel Xu on 2020/5/13.
//  Copyright © 2020 Civel Xu. All rights reserved.
//

import UIKit

public enum FontContentSizeStyle: Int {
    case contentSizeM // 默认标准
    case contentSizeXS
    case contentSizeS
    case contentSizeL
    case contentSizeXL
    case contentSizeXXL
    case contentSizeXXXL
}

public enum FontTextStyle {
    case headline
    case subheadline
    case body
    case footnote
    case caption1
    case caption2
}

let fontSizeTable: [FontTextStyle : [FontContentSizeStyle : CGFloat]] = {
    return [
        .headline: [
            .contentSizeXS: 14,
            .contentSizeS: 15,
            .contentSizeM: 16,
            .contentSizeL: 17,
            .contentSizeXL: 19,
            .contentSizeXXL: 21,
            .contentSizeXXXL: 21
        ],
        .subheadline: [
            .contentSizeXS: 12,
            .contentSizeS: 13,
            .contentSizeM: 14,
            .contentSizeL: 15,
            .contentSizeXL: 17,
            .contentSizeXXL: 19,
            .contentSizeXXXL: 21
        ],
        .body: [
            .contentSizeXS: 14,
            .contentSizeS: 15,
            .contentSizeM: 16,
            .contentSizeL: 17,
            .contentSizeXL: 19,
            .contentSizeXXL: 21,
            .contentSizeXXXL: 23
        ],
        .footnote: [
            .contentSizeXS: 12,
            .contentSizeS: 12,
            .contentSizeM: 12,
            .contentSizeL: 13,
            .contentSizeXL: 15,
            .contentSizeXXL: 17,
            .contentSizeXXXL: 19
        ],
        .caption1: [
            .contentSizeXS: 11,
            .contentSizeS: 11,
            .contentSizeM: 11,
            .contentSizeL: 12,
            .contentSizeXL: 14,
            .contentSizeXXL: 16,
            .contentSizeXXXL: 18
        ],
        .caption2: [
            .contentSizeXS: 11,
            .contentSizeS: 11,
            .contentSizeM: 11,
            .contentSizeL: 11,
            .contentSizeXL: 13,
            .contentSizeXXL: 15,
            .contentSizeXXXL: 17
        ],
    ]
}()

extension FontTextStyle {
    func fontSize() -> CGFloat {
        let style = FontTextManage.fontSizeStyle
        guard let dict = fontSizeTable[self], let value = dict[style] else {
            return 14
        }
        return value
    }
}

extension UIFont {

    static func applyFont(style: FontTextStyle, weight: Weight = .regular) -> UIFont {
        return .systemFont(ofSize: style.fontSize(), weight: weight)
    }
    
    static func applyFont(name: String, style: FontTextStyle) -> UIFont? {
        return UIFont.init(name: name, size: style.fontSize())
    }

}

//
//  FontTextManage.swift
//  FontChangeApp
//
//  Created by Civel Xu on 2020/4/26.
//  Copyright © 2020 Civel Xu. All rights reserved.
//

import UIKit
import Foundation

extension Notification.Name {
    public static let fontScaleDidChange = Notification.Name("com.xuxiwen.FontTextManageDidChange")
}

public final class FontTextManage {

    static let ScaleValueKey = "FontTextManage.ScaleValueKey"
    static let UserDefaultsKey = "FontTextManage.UserDefaultsKey"

    static var defaultStyle: FontTypeSizes = .large

    static var fontSizeStyle: FontTypeSizes {
        set {
            UserDefaults.standard.set(newValue.rawValue, forKey: UserDefaultsKey)
            observableStyle.value = newValue
            NotificationCenter.default.post(name: .fontScaleDidChange, object: [ScaleValueKey : newValue])
        }
        get {
            let value = UserDefaults.standard.integer(forKey: UserDefaultsKey)
            return value == 0 ? defaultStyle : FontTypeSizes(rawValue: value) ?? defaultStyle
        }
    }

    static var observableStyle = Observable(fontSizeStyle)
 
}


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

    public static let ScaleValueKey = "FontTextManage.ScaleValueKey"
    private static let UserDefaultsKey = "FontTextManage.UserDefaultsKey"

    static var fontSizeStyle: FontContentSizeStyle {
        set {
            UserDefaults.standard.set(newValue.rawValue, forKey: UserDefaultsKey)
            observableScale.value = newValue
            NotificationCenter.default.post(name: .fontScaleDidChange, object: [ScaleValueKey : newValue])
        }
        get {
            let value = UserDefaults.standard.integer(forKey: UserDefaultsKey)
            return FontContentSizeStyle(rawValue: value) ?? .contentSizeM
        }
    }

    static var observableScale = Observable(fontSizeStyle)
 
}


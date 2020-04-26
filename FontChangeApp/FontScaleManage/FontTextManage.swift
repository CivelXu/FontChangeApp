//
//  FontScaleManage.swift
//  FontChangeApp
//
//  Created by Civel Xu on 2020/4/26.
//  Copyright © 2020 Civel Xu. All rights reserved.
//

import UIKit
import Foundation

extension Notification.Name {
    public static let fontScaleDidChange = Notification.Name("com.xuxiwen.fontScaleDidChange")
}

public final class FontTextManage {
    
    public static let ScaleValueKey = "FontScaleManage.ScaleValueKey"

    private static let UserDefaultsKey = "FontScaleManage.UserDefaultsKey"

    static var scaleValue: FontSizeChangeStyle {
        set {
            UserDefaults.standard.set(newValue.rawValue, forKey: UserDefaultsKey)
            observableScale.value = newValue
            NotificationCenter.default.post(name: .fontScaleDidChange, object: [ScaleValueKey : newValue])
        }
        get {
            let value = UserDefaults.standard.integer(forKey: UserDefaultsKey)
            return FontSizeChangeStyle(rawValue: value) ?? .contentSizeM
        }
    }

    static var observableScale = Observable(scaleValue)
 
}


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

public final class FontScaleManage {
    
    public static let ScaleValueKey = "FontScaleManage.ScaleValueKey"

    private static let UserDefaultsKey = "FontScaleManage.UserDefaultsKey"

    static var scaleValue: CGFloat {
        set {
            UserDefaults.standard.set("\(newValue)", forKey: UserDefaultsKey)
            observableScale.value = newValue
            NotificationCenter.default.post(name: .fontScaleDidChange, object: [ScaleValueKey : newValue])
        }
        get {
            guard let string = UserDefaults.standard.value(forKey: UserDefaultsKey) as? String, let floatValue = Float(string) else {
                return 1
            }
            return CGFloat(floatValue)
        }
    }

    static var observableScale = Observable(scaleValue)
 
}


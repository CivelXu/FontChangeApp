//
//  FontAutoAdjust.swift
//  FontChangeApp
//
//  Created by Civel Xu on 2020/4/26.
//  Copyright © 2020 Civel Xu. All rights reserved.
//

import UIKit
import Foundation

public protocol FontAutoAdjust: AnyObject {
    associatedtype Item
    func bindFont(style: FontTypeStyle)
    func bindFont(observerBlock: @escaping (FontTypeSizes) -> Void)
    func dispose()
}

public extension FontAutoAdjust {

    func bindFont(style: FontTypeStyle) {
        FontTextManage.observableStyle.observe(on: self) { [weak self] _ in
            guard let `self` = self else { return }
            guard let item = self as? Self.Item else { return }
            if let button = item as? UIButton {
                button.titleLabel?.font = .applyFont(style: style)
            } else if let label = item as? UILabel {
                label.font = .applyFont(style: style)
            } else if let textView = item as? UITextView {
                textView.font = .applyFont(style: style)
            } else if let textField = item as? UITextField {
                textField.font = .applyFont(style: style)
            }
        }
    }

    func bindFont(observerBlock: @escaping (FontTypeSizes) -> Void) {
        FontTextManage.observableStyle.observe(on: self, observerBlock: observerBlock)
    }

    func dispose() {
        FontTextManage.observableStyle.remove(observer: self)
    }

}

extension UIButton: FontAutoAdjust {
    public typealias Item = UIButton
}
extension UILabel: FontAutoAdjust {
    public typealias Item = UILabel
}
extension UITextField: FontAutoAdjust {
    public typealias Item = UITextField
}
extension UITextView: FontAutoAdjust {
    public typealias Item = UITextView
}

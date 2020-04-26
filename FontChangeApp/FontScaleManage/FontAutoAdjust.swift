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
    func bindFont(observerBlock: @escaping (CGFloat) -> Void)
    func bindFont(observerBlock: @escaping (Item, CGFloat) -> Void)
    func dispose()
}

public extension FontAutoAdjust {

    func bindFont(observerBlock: @escaping (CGFloat) -> Void) {
        FontScaleManage.observableScale.observe(on: self, observerBlock: observerBlock)
    }

    func bindFont(observerBlock: @escaping (Item, CGFloat) -> Void) {
        FontScaleManage.observableScale.observe(on: self) { [weak self] scale in
            guard let item = self as? Self.Item else { return }
            observerBlock(item, scale)
        }
    }

    func dispose() {
        FontScaleManage.observableScale.remove(observer: self)
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

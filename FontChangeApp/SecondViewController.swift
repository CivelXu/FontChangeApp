//
//  SecondViewController.swift
//  FontChangeApp
//
//  Created by Civel Xu on 2020/4/26.
//  Copyright © 2020 Civel Xu. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var textFiled: UITextField!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var slider: UISlider!
    
    deinit {
        label.dispose()
        button.dispose()
        textFiled.dispose()
        textView.dispose()
        print("\(String(describing: type(of: self))) - deinit")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        slider.minimumValue = 0.5
        slider.maximumValue = 1.5
        slider.value = Float(FontScaleManage.scaleValue)

        label.bindFont { $0.font = .systemFont(ofSize: ceil(14 * $1)) }
        button.bindFont { $0.titleLabel?.font = .systemFont(ofSize: ceil(16 * $1)) }
        textFiled.bindFont { $0.font = .systemFont(ofSize: ceil(17 * $1)) }
        textView.bindFont { $0.font = .systemFont(ofSize: ceil(14 * $1)) }

        NotificationCenter.default.addObserver(self, selector: #selector(fontChanged(notify:)), name: .fontScaleDidChange, object: nil)

    }

    @IBAction func sliderAction(_ sender: UISlider) {
        FontScaleManage.scaleValue = CGFloat(sender.value)
    }

    @objc func fontChanged(notify: Notification) {
        guard let object = notify.object as? [String : Any] else { return }
        guard let scale = object[FontScaleManage.ScaleValueKey] as? CGFloat else { return }
        debugPrint("fontChanged scale - \(scale)")
    }

}

//
//  FirstViewController.swift
//  FontChangeApp
//
//  Created by Civel Xu on 2020/4/26.
//  Copyright © 2020 Civel Xu. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var textFiled: UITextField!
    @IBOutlet weak var textView: UITextView!
    
    deinit {
        label.dispose()
        button.dispose()
        textFiled.dispose()
        textView.dispose()
        print("\(String(describing: type(of: self))) - deinit")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        label.bindFont(style: .body)
        button.bindFont(style: .caption1)
        textFiled.bindFont(style: .headline)
        textView.bindFont(style: .headline)

        NotificationCenter.default.addObserver(self, selector: #selector(fontChanged(notify:)), name: .fontScaleDidChange, object: nil)
    }

    @objc func fontChanged(notify: Notification) {
        guard let object = notify.object as? [String : FontContentSizeStyle] else { return }
        guard let style = object[FontTextManage.ScaleValueKey] else { return }
        debugPrint("FirstViewController fontChanged style - \(style)")
    }

}

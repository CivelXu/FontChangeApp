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
    @IBOutlet weak var segment: UISegmentedControl!
    
    deinit {
        label.dispose()
        button.dispose()
        textFiled.dispose()
        textView.dispose()
        print("\(String(describing: type(of: self))) - deinit")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        segment.selectedSegmentIndex = FontTextManage.fontSizeStyle.rawValue

        label.bindFont(style: .body)
        button.bindFont(style: .caption1)
        textFiled.bindFont(style: .headline)
        textView.bindFont(style: .headline)

        NotificationCenter.default.addObserver(self, selector: #selector(fontChanged(notify:)), name: .fontScaleDidChange, object: nil)

    }

    @IBAction func segAction(_ sender: UISegmentedControl) {
        let index = sender.selectedSegmentIndex
        FontTextManage.fontSizeStyle = FontContentSizeStyle(rawValue: index) ?? FontContentSizeStyle.contentSizeM
    }
 
    @objc func fontChanged(notify: Notification) {
        guard let object = notify.object as? [String : FontContentSizeStyle] else { return }
        guard let style = object[FontTextManage.ScaleValueKey] else { return }
        debugPrint("SecondViewController fontChanged style - \(style)")
    }

}

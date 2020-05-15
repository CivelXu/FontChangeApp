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

        
        segment.selectedSegmentIndex = FontTextManage.fontSizeStyle.rawValue - 1

        label.bindFont(style: .title1)
        button.bindFont(style: .title3)
        textFiled.bindFont(style: .headline)
        textView.bindFont(style: .caption2)

        NotificationCenter.default.addObserver(self, selector: #selector(fontChanged(notify:)), name: .fontScaleDidChange, object: nil)

    }

    @IBAction func segAction(_ sender: UISegmentedControl) {
        let index = sender.selectedSegmentIndex + 1
        if let style = FontTypeSizes(rawValue: index) {
             FontTextManage.fontSizeStyle = style
        }
    }
 
    @objc func fontChanged(notify: Notification) {
        guard let object = notify.object as? [String : FontTypeSizes] else { return }
        guard let style = object[FontTextManage.FontSizeStyleKey] else { return }
        debugPrint("SecondViewController fontChanged style - \(style)")
    }

}

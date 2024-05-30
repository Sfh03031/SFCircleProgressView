//
//  ViewController.swift
//  SFCircleProgressView
//
//  Created by SparkeXHApp on 05/30/2024.
//  Copyright (c) 2024 SparkeXHApp. All rights reserved.
//

import UIKit
import SFCircleProgressView

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.addSubview(circleView)
        self.view.addSubview(pslider)
    }
    
    //MARK: - valueChange event
    
    @objc func valueChange(_ sender: UISlider) {
        circleView.progress = CGFloat(sender.value)
        circleView.text = String(format: "%.2f%%", sender.value * 100.0)
    }
    
    //MARK: - lazyload
    
    lazy var circleView: SFCircleProgressView = {
        let v = SFCircleProgressView()
        v.frame = CGRect(x: (UIScreen.main.bounds.width - 300) / 2, y: 200, width: 300, height: 300)
        v.progress = 0
        v.lineWith = 30.0
        v.lineColor = .lightGray
        v.proLineWith = 20.0
        v.proColors = [UIColor.red.cgColor, UIColor.yellow.cgColor]
        v.textColor = .red
        v.textFont = UIFont.systemFont(ofSize: 30, weight: .bold)
        return v
    }()
    
    lazy var pslider: UISlider = {
        let slider = UISlider(frame: CGRect(x: 20, y: 550, width: UIScreen.main.bounds.width - 40, height: 120))
        slider.minimumValue = 0
        slider.maximumValue = 1
        slider.addTarget(self, action: #selector(valueChange(_ :)), for: .valueChanged)
        return slider
    }()

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}


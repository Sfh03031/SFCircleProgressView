//
//  SFCircleProgressView.swift
//  SFCircleProgressView
//
//  Created by sfh on 2024/5/29.
//

import UIKit

public class SFCircleProgressView: UIView {
    
    /// 进度 0~1
    @IBInspectable public var progress: CGFloat = 0 {
        didSet {
            if progress <= 1.0 && progress >= 0.0 {
                circleView.progress = progress
            } else {
                fatalError("progress can not beyond [0.0, 1.0]")
            }
        }
    }
    
    /// 背景线宽
    @IBInspectable public var lineWith: CGFloat = 2.0 {
        didSet {
            circleView.lineWith = lineWith
        }
    }
    
    /// 背景线色
    @IBInspectable public var lineColor: UIColor = .blue{
        didSet {
            circleView.lineColor = lineColor
        }
    }
    
    /// 进度线宽
    @IBInspectable public var proLineWith: CGFloat = 2.0 {
        didSet {
            circleView.proLineWith = proLineWith
        }
    }
    
    /// 进度线色，支持渐变
    @IBInspectable public var proColors: [Any] = [UIColor.red.cgColor, UIColor.systemTeal.cgColor]{
        didSet {
            circleView.proColors = proColors
        }
    }
    
    /// 文字内容
    @IBInspectable public var text: String = "" {
        didSet {
            alphaLabel.text = text
            alphaLabel.sizeToFit()
        }
    }
    
    /// 文字颜色
    @IBInspectable public var textColor: UIColor = .blue {
        didSet {
            alphaLabel.textColor = textColor
        }
    }
    
    /// 文字字体
    @IBInspectable public var textFont: UIFont = UIFont.systemFont(ofSize: 12, weight: .medium) {
        didSet {
            alphaLabel.font = textFont
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = #colorLiteral(red: 0.9687491059, green: 0.9721953273, blue: 0.9813622832, alpha: 1)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        
        self.layer.cornerRadius = self.bounds.width / 2
        self.layer.masksToBounds = true
        
        loadViews()
    }
    
    func loadViews() {
        self.addSubview(circleView)
        self.addSubview(alphaLabel)
        
        circleView.frame = CGRect(x: 0, y: 0, width: self.bounds.height, height: self.bounds.height)
        alphaLabel.sizeToFit()
        alphaLabel.center = circleView.center
    }
    
    //MARK: - lazyload
    
    lazy var circleView: SFCircleView = {
        let circle = SFCircleView()
        circle.lineWith = 2.0
        circle.lineColor = #colorLiteral(red: 0, green: 0.6233735085, blue: 1, alpha: 1)
        circle.progress = 0.5
        return circle
    }()
    
    lazy var alphaLabel: UILabel = {
        let label = UILabel()
        label.text = "0%"
        label.textColor = #colorLiteral(red: 0, green: 0.6233735085, blue: 1, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        label.textAlignment = .center
        return label
    }()

}

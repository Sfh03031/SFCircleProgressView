//
//  SFCircleView.swift
//  SFCircleProgressView
//
//  Created by sfh on 2024/5/29.
//

import UIKit

public class SFCircleView: UIView {

    /// 进度
    @IBInspectable public var progress: CGFloat = 0.0 {
        didSet {
            progressLayer.strokeEnd = progress
            progressLayer.removeAllAnimations()
        }
    }
    
    /// 背景线宽
    @IBInspectable public var lineWith: CGFloat = 2.0
    /// 背景线色
    @IBInspectable public var lineColor: UIColor = .blue
    
    /// 进度线宽
    @IBInspectable public var proLineWith: CGFloat = 2.0
    /// 进度线色
    @IBInspectable public var proColors: [Any] = [UIColor.red.cgColor, UIColor.systemTeal.cgColor]
    
    fileprivate var progressLayer: CAShapeLayer = CAShapeLayer()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        //self.bounds在这里取不到
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        
        loadViews()
    }
    
    func loadViews() {
        let centerX = self.bounds.width / 2
        let centerY = self.bounds.height / 2
        
        let radius = (self.bounds.width - lineWith) / 2
        
        let path = UIBezierPath(arcCenter: CGPoint(x: centerX, y: centerY), radius: radius, startAngle: (-0.5 * Double.pi), endAngle: (1.5 * Double.pi), clockwise: true)
        
        let backLayer = CAShapeLayer()
        backLayer.frame = self.bounds
        backLayer.fillColor = UIColor.clear.cgColor
        backLayer.strokeColor = lineColor.cgColor
        backLayer.lineWidth = lineWith
        backLayer.path = path.cgPath
        backLayer.strokeEnd = 1
        self.layer.addSublayer(backLayer)
        
        progressLayer = CAShapeLayer()
        progressLayer.frame = self.bounds
        progressLayer.fillColor = UIColor.clear.cgColor
        progressLayer.strokeColor = lineColor.cgColor
        progressLayer.lineWidth = proLineWith
        progressLayer.lineCap = kCALineCapRound
        progressLayer.path = path.cgPath
        progressLayer.strokeEnd = progress
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.bounds
        gradientLayer.colors = proColors
        gradientLayer.startPoint = CGPointMake(0, 0)
        gradientLayer.endPoint = CGPointMake(0, 1)
        gradientLayer.mask = progressLayer
        self.layer.addSublayer(gradientLayer)
    }
    
}

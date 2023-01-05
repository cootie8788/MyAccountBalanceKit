//
//  GradientView.swift
//  MyAccountBalancekit
//
//  Created by Henry Lin on 2023/1/5.
//

import UIKit
///漸層的畫面
class GradientView: UIView {
    let gradientLayer = CAGradientLayer()
    private var colors:[CGColor] = [UIColor.white.cgColor , UIColor.white.cgColor]{
        didSet{
            gradientLayer.colors = colors
        }
    }
    
    @IBInspectable var startColor:UIColor = .white {
        didSet{
            var colors = self.colors
            colors[0] = startColor.cgColor
            self.colors = colors
        }
    }
    @IBInspectable var endColor:UIColor = .white {
        didSet{
            var colors = self.colors
            colors[1] = endColor.cgColor
            self.colors = colors
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        self.initView()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.initView()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    private func initView(){
        gradientLayer.frame = self.bounds
        gradientLayer.colors = colors
        gradientLayer.startPoint = CGPoint(x: 0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0.5)
        gradientLayer.zPosition = -1
        self.layer.addSublayer(gradientLayer)
    }
    
    override var bounds: CGRect{
        didSet{
            gradientLayer.frame = self.bounds
        }
    }
}

class GradientViewUptoDown: UIView {
    let gradientLayer = CAGradientLayer()
    private var colors:[CGColor] = [UIColor.white.cgColor , UIColor.white.cgColor]{
        didSet{
            gradientLayer.colors = colors
        }
    }
    
    @IBInspectable var startColor:UIColor = .white {
        didSet{
            var colors = self.colors
            colors[0] = startColor.cgColor
            self.colors = colors
        }
    }
    @IBInspectable var endColor:UIColor = .white {
        didSet{
            var colors = self.colors
            colors[1] = endColor.cgColor
            self.colors = colors
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        self.initView()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.initView()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    private func initView(){
        gradientLayer.zPosition = -1
        gradientLayer.frame = self.bounds
        gradientLayer.colors = colors
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0, y: 1)
        self.layer.addSublayer(gradientLayer)
    }
    
    override var bounds: CGRect{
        didSet{
            gradientLayer.frame = self.bounds
        }
    }
}



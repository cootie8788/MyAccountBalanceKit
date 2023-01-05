//
//  AccountBalanceView.swift
//  MyAccountBalancekit
//
//  Created by Henry Lin on 2023/1/5.
//

import UIKit

@IBDesignable
class AccountBalanceView: UIView, NibOwnerLoadable{
    
    @IBOutlet weak var usdView: GradientView!
    @IBOutlet weak var khrView: GradientView!
    
    // MARK: - Initialier
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        customInit()
    }
}

// MARK: - private func
private extension AccountBalanceView {
    func customInit() {
        loadNibContent()
        usdView.startColor = #colorLiteral(red: 0.9411764706, green: 0.9411764706, blue: 0.9411764706, alpha: 1)
        usdView.startColor = #colorLiteral(red: 0.9843137255, green: 0.9843137255, blue: 0.9843137255, alpha: 1)
        khrView.startColor = #colorLiteral(red: 0.9411764706, green: 0.9411764706, blue: 0.9411764706, alpha: 1)
        khrView.startColor = #colorLiteral(red: 0.9843137255, green: 0.9843137255, blue: 0.9843137255, alpha: 1)
    }
    
    
}


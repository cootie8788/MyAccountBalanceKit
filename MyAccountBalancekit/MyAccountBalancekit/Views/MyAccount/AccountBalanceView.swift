//
//  AccountBalanceView.swift
//  MyAccountBalancekit
//
//  Created by Henry Lin on 2023/1/5.
//

import UIKit

@IBDesignable
class AccountBalanceView: UIView, NibOwnerLoadable{
    
    

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
        
    }
    
    
}


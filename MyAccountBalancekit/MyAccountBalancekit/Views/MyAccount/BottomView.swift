//
//  BottomView.swift
//  MyAccountBalancekit
//
//  Created by Henry2133_Lin on 2023/1/5.
//
import UIKit

@IBDesignable
class BottomView: UIView, NibOwnerLoadable{
    
    

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
private extension BottomView {
    func customInit() {
        loadNibContent()
        
    }
    
    
}

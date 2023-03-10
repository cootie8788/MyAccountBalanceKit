//
//  MyFavoriteTitleView.swift
//  MyAccountBalancekit
//
//  Created by Henry Lin on 2023/1/5.
//

import UIKit

@IBDesignable
class MyFavoriteTitleView: UIView, NibOwnerLoadable{
    
    // MARK: - Initialier
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        customInit()
    }
    
    // MARK: IBActions
    @IBAction func onMoreButtonClick(_ sender: Any) {
    }
}

// MARK: - private func
private extension MyFavoriteTitleView {
    func customInit() {
        loadNibContent()
        
    }
}


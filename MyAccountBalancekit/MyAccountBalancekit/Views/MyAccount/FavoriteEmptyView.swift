//
//  FavoriteEmptyView.swift
//  MyAccountBalancekit
//
//  Created by Henry Lin on 2023/1/5.
//

import UIKit

@IBDesignable
class FavoriteEmptyView: UIView, NibOwnerLoadable{
    
    

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
private extension FavoriteEmptyView {
    func customInit() {
        loadNibContent()
        
    }
    
    
}


//
//  PaymentMethodCollectionViewCell.swift
//  MyAccountBalancekit
//
//  Created by Henry Lin on 2023/1/5.
//

import UIKit

class PaymentMethodCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var paymentImageView: UIImageView!
    @IBOutlet weak var paymentTitleLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setItem(item:PaymentMethod) {
        paymentImageView.image = UIImage(named: item.imageStr)
        paymentTitleLabel.text = item.imageTitle
        
    }

}

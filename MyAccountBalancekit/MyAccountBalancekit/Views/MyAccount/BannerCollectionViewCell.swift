//
//  BannerCollectionViewCell.swift
//  MyAccountBalancekit
//
//  Created by Henry2133_Lin on 2023/1/5.
//

import UIKit

class BannerCollectionViewCell: UICollectionViewCell {
    
    // MARK: IBOutlets
    @IBOutlet weak var imageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setItem(item:Banner) {
        guard let url = URL(string: item.linkUrl) else {return}
        ImageManager.shared.fetchImage(url: url) {[weak self] image in
            guard let `self` = self else {return}
            DispatchQueue.main.async {
                self.imageView.image = image
            }
        }
        
    }
    
}

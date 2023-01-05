//
//  BannerView.swift
//  MyAccountBalancekit
//
//  Created by Henry2133_Lin on 2023/1/5.
//

import UIKit

@IBDesignable
class BannerView: UIView, NibOwnerLoadable{
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pages: UIPageControl!
    
    var imageArray = ["avatar","iconBell01Nomal","button00ElementScrollEmpty","button00ElementScrollEmpty","button00ElementScrollEmpty"]
    var index = 0
    
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
private extension BannerView {
    func customInit() {
        
        loadNibContent()
        
        Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(pageSetup), userInfo: nil, repeats: true)
        
        self.collectionView.register(UINib(nibName:
                                            "BannerCollectionViewCell", bundle:nil),
                                     forCellWithReuseIdentifier: "bannerCollectionViewCell")
        
        Style.RoundCorner.setRoundCorner(view: collectionView, radius: 12, color: UIColor.white.cgColor)
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        
    }
    
    @objc func pageSetup(){
        if index < imageArray.count - 1 {
            index = index + 1
        }else {
            index = 0
        }
        pages.numberOfPages = imageArray.count
        pages.currentPage = index
        collectionView.scrollToItem(at: IndexPath(item: index, section: 0), at: .right, animated: true)
        
    }
    
}

// MARK: CollectionViewDataSource, UICollectionViewDelegate
extension BannerView: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "bannerCollectionViewCell", for:
                                                                indexPath) as? BannerCollectionViewCell else { return UICollectionViewCell()}
        cell.imageView.image = UIImage(named: imageArray[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    
}



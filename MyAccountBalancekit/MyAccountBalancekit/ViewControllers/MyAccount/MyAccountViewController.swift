//
//  MyAccountViewController.swift
//  MyAccountBalancekit
//
//  Created by Henry Lin on 2023/1/4.
//

import UIKit
import Combine

class MyAccountViewController: BaseViewController {
    
    // MARK: IBOutlets
    @IBOutlet weak var myAccountTopView: MyAccountTopView!
    @IBOutlet weak var paymentMethodView: PaymentMethodView!
    @IBOutlet weak var myScrollingView: UIScrollView!
    @IBOutlet weak var accountBalanceView: AccountBalanceView!
    @IBOutlet weak var bannerView: BannerView!
    @IBOutlet weak var bannerEmptyView: BannerEmptyView!
    @IBOutlet weak var favoriteView: FavoriteView!
    @IBOutlet weak var FavoriteEmptyView: FavoriteEmptyView!
    
    // MARK: Properties
    var viewModel = MyAccountViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ///
        ///dog
        setUI()
        binding()
        viewModel.getEmptyNotificationList()
        viewModel.getUsdTotalAmount1()
        viewModel.getKhrTotalAmount1()
        viewModel.getFavoriteList()
        startLoadingView()
    }
    
    
    
}

private extension MyAccountViewController {
    
    func setUI() {
        bannerView.isHidden = true
        bannerEmptyView.isHidden = false
        favoriteView.isHidden = true
        FavoriteEmptyView.isHidden = false
        myScrollingView.bounces = true
        myAccountTopView.delegate = self
        configureRefreshControl()
    }
    
    func binding() {
        
        viewModel.$loadingEven
            .receive(on: RunLoop.main)
            .sink {[weak self] loadingEven in
                switch loadingEven {
                case .loading:
                    self?.startLoadingView()
                case .stop:
                    self?.stopLoadingView()
                }
            }
            .store(in: &cancellable)
        
        viewModel.$messagesList
            .receive(on: RunLoop.main)
            .sink {[weak self] messagesList in
                self?.myAccountTopView.setBellImageView(messagesList: self?.viewModel.messagesList ?? [])
            }
            .store(in: &cancellable)
        
        viewModel.$usdTotalAmount
            .receive(on: RunLoop.main)
            .sink {[weak self] data in
                guard let `self` = self else {return}
                let totalStr = String(self.viewModel.usdTotalAmount ?? 0).thousandths
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {[weak self] in
                    self?.accountBalanceView.setUsdTotalAmount(total: totalStr)
                    
                }
            }
            .store(in: &cancellable)
        
        viewModel.$khrTotalAmount
            .receive(on: RunLoop.main)
            .sink {[weak self] data in
                guard let `self` = self else {return}
                let totalStr = String(self.viewModel.khrTotalAmount ?? 0).thousandths
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {[weak self] in
                    self?.accountBalanceView.setKhrTotalAmount(total: totalStr)
                }
                
            }
            .store(in: &cancellable)
        
        viewModel.$bannerList
            .receive(on: RunLoop.main)
            .sink {[weak self] bannerList in
                self?.bannerView.setBanner(list: self?.viewModel.bannerList ?? [])
                
            }
            .store(in: &cancellable)
        
        viewModel.$favoriteList
            .receive(on: RunLoop.main)
            .sink {[weak self] favoriteList in
                self?.favoriteView.setFavoriteList(list: self?.viewModel.favoriteList ?? [])
                
            }
            .store(in: &cancellable)
        
    }
    
    @objc
    func showData(){
        
    }
    
    func configureRefreshControl () {
        myScrollingView.refreshControl = UIRefreshControl()
        myScrollingView.refreshControl?.addTarget(self, action:
                                                    #selector(handleRefreshControl),
                                                  for: .valueChanged)
    }
    
    @objc func handleRefreshControl() {
        DispatchQueue.main.async {
            self.accountBalanceView.showShimmer()
            self.bannerView.isHidden = false
            self.bannerEmptyView.isHidden = true
            self.favoriteView.isHidden = false
            self.FavoriteEmptyView.isHidden = true
            self.myScrollingView.refreshControl?.endRefreshing()
        }
        viewModel.getBunner()
        viewModel.getFavoriteList()
        viewModel.getNotificationList()
        viewModel.getUsdTotalAmount2()
        viewModel.getKhrTotalAmount2()
    }
}

extension MyAccountViewController:MyAccountTopViewDelegate {
    func goNotificationVC() {
        let vc = NotificationViewController(list: viewModel.messagesList)
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

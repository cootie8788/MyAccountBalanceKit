//
//  BaseViewController.swift
//  MyAccountBalancekit
//
//  Created by Henry Lin on 2023/1/7.
//

import UIKit
import Combine

class BaseViewController: UIViewController {
    var cancellable = Set<AnyCancellable>()
    var loadingView = UIActivityIndicatorView(style: .large)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.backButtonDisplayMode = .minimal
        setLeftNavigationBarItems()
        setLoadingView()
    }
    
    private func setLoadingView() {
        loadingView.center = view.center
        view.addSubview(loadingView)
        
    }
    
    func startLoadingView() {
        view.bringSubviewToFront(loadingView)
        loadingView.startAnimating()
    }
    
    func stopLoadingView() {
        loadingView.stopAnimating()
    }
    
    func setLeftNavigationBarItems() {
        var leftBarButtonItems:[UIBarButtonItem] = []
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 24, height: 24))
        button.setImage(UIImage(named: "iconArrowWTailBack"), for: .normal)
        button.widthAnchor.constraint(equalToConstant: 24).isActive = true
        button.heightAnchor.constraint(equalToConstant: 24).isActive = true
        button.addTarget(self, action: #selector(onBarBackBtnClicked(sender:)), for: .touchUpInside)
        
        leftBarButtonItems.append(UIBarButtonItem(customView: button))
        navigationItem.leftBarButtonItems = leftBarButtonItems
    }
    
    @objc func onBarBackBtnClicked(sender:UIButton){
        navigationController?.popViewController(animated: true)
    }
}




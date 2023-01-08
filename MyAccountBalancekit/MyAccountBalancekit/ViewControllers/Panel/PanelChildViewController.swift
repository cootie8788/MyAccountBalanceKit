//
//  PanelChildViewController.swift
//  MyAccountBalancekit
//
//  Created by Henry2133_Lin on 2023/1/5.
//

import UIKit


enum PanelChildPage {
    case Home
    case Account
    case Location
    case Service
}

class PanelChildViewController: UIViewController {
    
    // MARK: IBOutlets
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var tabbarView: UIView!
    
    // MARK: Properties
    private var currentPage:PanelChildPage?
    private var homeChildController: MyAccountViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUi()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        navigationController?.navigationBar.isHidden = false
    }
    
    // MARK: Init
    init(){
        super.init(nibName: "PanelChildViewController", bundle: nil)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func showHomePage() {
        guard currentPage != .Home else {
            return
        }
        if homeChildController == nil {
            homeChildController = MyAccountViewController()
            guard let vc = homeChildController else {
                return
            }
            addChild(vc)
        }
        showPageView(page: .Home)
    }
    
    private func showPageView(page: PanelChildPage) {
        
        var relatedVC:UIViewController?
        switch page {
        case .Home:
            relatedVC = homeChildController
            break
        case .Account:
            relatedVC = homeChildController
            break
        case .Location:
            relatedVC = homeChildController
            break
        case .Service:
            relatedVC = homeChildController
        }
        guard let vc = relatedVC, children.contains(vc)  else{
            return
        }
        clearContentView()
        
        vc.view.frame = contentView.frame
        contentView.addSubview(vc.view)
        vc.didMove(toParent: self)
        
        switch page {
        case .Home:
            currentPage = .Home
        case .Account:
            currentPage = .Account
        case .Location:
            currentPage = .Location
        case .Service:
            currentPage = .Service
        }
        self.view.layoutIfNeeded()
    }
    
    private func clearContentView(){
        for subview in contentView.subviews{
            subview.removeFromSuperview()
        }
    }
    
    private func updateUi() {
        if currentPage == nil {
            showHomePage()
        }
        
        Style.Shadow.setDefaultShadow(view: tabbarView, cornerRadius: 25)
    }
    
}

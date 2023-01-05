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
    private var accountChildController: AccountViewController?
    private var locationChildController: LocationViewController?
    private var serviceChildController: ServiceViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUi()
    }
    
    // MARK: Init
    init(){
        super.init(nibName: "PanelChildViewController", bundle: nil)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func showHomePage() {
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
            relatedVC = accountChildController
            break
        case .Location:
            relatedVC = locationChildController
            break
        case .Service:
            relatedVC = serviceChildController
        }
        guard let vc = relatedVC, children.contains(vc)  else{
            return
        }
        clearContentView()
        
        vc.view.frame = contentView.frame
        contentView.addSubview(vc.view)
        vc.didMove(toParent: self)
        print("contentView.frame.height:\(contentView.frame.height)")
        contentView.translatesAutoresizingMaskIntoConstraints = false
        vc.view.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        vc.view.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        vc.view.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        vc.view.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        
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
//        Style.RoundCorner.setRoundCorner(view: tabbarView, radius: 25, color: UIColor.white.cgColor)
        Style.Shadow.setDefaultShadow(view: tabbarView, cornerRadius: 25)
    }
    
    
}

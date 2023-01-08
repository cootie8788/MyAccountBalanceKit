//
//  NotificationViewController.swift
//  MyAccountBalancekit
//
//  Created by Henry Lin on 2023/1/7.
//

import UIKit

class NotificationViewController: BaseViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var items:[Notification] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setupTableView()
    }

    // MARK: Properties
    private var dataSource: NotificationTableViewDataSource?
    
    // MARK: Init
    init(list:[Notification]){
        super.init(nibName: "NotificationViewController", bundle: nil)
        items = list
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func showNotificationList(list: [Notification]) {
        dataSource?.items = list
    }
    
}

private extension NotificationViewController {
    
    func setUI() {
        self.title = "Notification"
    }
    
    func setupTableView() {
        tableView.register(UINib(nibName: "NotificationTableViewCell", bundle: nil), forCellReuseIdentifier: "NotificationTableViewCell")
        dataSource = NotificationTableViewDataSource(items: items, itemIdentifier: "NotificationTableViewCell")
        tableView.dataSource = dataSource
        tableView.delegate = dataSource
    }
    
}

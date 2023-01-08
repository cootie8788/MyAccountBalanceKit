//
//  Account.swift
//  MyAccountBalancekit
//
//  Created by Henry Lin on 2023/1/6.
//

import Foundation

struct Saving: Codable, Hashable {
    var savingsList:[Account]
    
    enum CodingKeys: String, CodingKey {
        case savingsList = "savingsList"
    }
    
}

struct FixedDeposit: Codable, Hashable {
    var fixedDepositList:[Account]
    
    enum CodingKeys: String, CodingKey {
        case fixedDepositList = "fixedDepositList"
    }
    
}

struct Digital: Codable, Hashable {
    var digitalList:[Account]
    
    enum CodingKeys: String, CodingKey {
        case digitalList = "digitalList"
    }
    
}

struct Account: Codable, Hashable {
    var account: String
    var curr: String
    var balance: Double
    
    enum CodingKeys: String, CodingKey {
        case account = "account"
        case curr = "curr"
        case balance = "balance"
    }
}

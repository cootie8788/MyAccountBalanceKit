//
//  Notification.swift
//  MyAccountBalancekit
//
//  Created by Henry Lin on 2023/1/6.
//

import Foundation

struct Message: Codable, Hashable {
    var messages:[Notification]
   
    enum CodingKeys: String, CodingKey {
        case messages = "messages"
    }
}

struct Notification: Codable, Hashable {
    var status: Bool
    var updateDateTime: String
    var title: String
    var message: String
    
    enum CodingKeys: String, CodingKey {
        case status = "status"
        case updateDateTime = "updateDateTime"
        case title = "title"
        case message = "message"
    }
}


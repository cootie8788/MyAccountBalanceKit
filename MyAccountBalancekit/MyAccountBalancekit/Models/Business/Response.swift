//
//  Response.swift
//  MyAccountBalancekit
//
//  Created by Henry Lin on 2023/1/6.
//

import Foundation

struct Response<T:Codable>: Codable {
    var msgCode: String?
    var msgContent:String?
    var result: T
}


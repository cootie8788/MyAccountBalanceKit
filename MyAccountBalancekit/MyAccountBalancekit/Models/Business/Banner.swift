//
//  Banner.swift
//  MyAccountBalancekit
//
//  Created by Henry Lin on 2023/1/7.
//

import Foundation

struct Banners: Codable, Hashable {
    var bannerList:[Banner]
    
    enum CodingKeys: String, CodingKey {
        case bannerList = "bannerList"
    }
    
}

struct Banner: Codable, Hashable {
    var adSeqNo: Int
    var linkUrl: String
    
    enum CodingKeys: String, CodingKey {
        case adSeqNo = "adSeqNo"
        case linkUrl = "linkUrl"
    }
}

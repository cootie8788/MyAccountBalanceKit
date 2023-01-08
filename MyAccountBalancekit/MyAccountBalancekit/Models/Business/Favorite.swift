//
//  Favorite.swift
//  MyAccountBalancekit
//
//  Created by Henry Lin on 2023/1/6.
//

import Foundation

struct Favorites: Codable, Hashable {
    var favoriteList:[Favorite]
    
    enum CodingKeys: String, CodingKey {
        case favoriteList = "favoriteList"
    }
    
}

struct Favorite: Codable, Hashable {
    var nickname: String
    var transType: String
    
    enum CodingKeys: String, CodingKey {
        case nickname = "nickname"
        case transType = "transType"
    }
}

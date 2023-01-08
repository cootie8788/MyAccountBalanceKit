//
//  APIManager.swift
//  MyAccountBalancekit
//
//  Created by Henry Lin on 2023/1/6.
//

import Foundation
import Combine

class APIManager {
    static let shared = APIManager()
    
    private init() {}
    
    func requestAPI<T: Codable>(url: String) -> AnyPublisher<T, Error> {
        guard let url = URL(string: url) else {
            return Fail(error: NetworkError.urlError).eraseToAnyPublisher()
        }
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .map({$0.data})
            .decode(type: T.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
    
    func getEmptyNotificationList() -> AnyPublisher<Message, Error> {
        let publisher: AnyPublisher<Response<Message>, Error> = requestAPI(url: API.getEmptyNotificationList.fullUrl)
        return publisher.map({$0.result}).eraseToAnyPublisher()
        
    }
    
    func getNotificationList()-> AnyPublisher<Message, Error> {
        let publisher: AnyPublisher<Response<Message>, Error> = requestAPI(url: API.getNotificationList.fullUrl)
        return publisher.map({$0.result}).eraseToAnyPublisher()
        
    }
    
    func getUsdSavings1() -> AnyPublisher<Saving, Error> {
        let publisher: AnyPublisher<Response<Saving>, Error> = requestAPI(url: API.getUsdSavings1.fullUrl)
        return publisher.map({$0.result}).eraseToAnyPublisher()
        
    }
    
    func getUsdFixed1() -> AnyPublisher<FixedDeposit, Error> {
        let publisher: AnyPublisher<Response<FixedDeposit>, Error> = requestAPI(url: API.getUsdFixed1.fullUrl)
        return publisher.map({$0.result}).eraseToAnyPublisher()
        
    }
    
    func getUsdDigital1() -> AnyPublisher<Digital, Error> {
        let publisher: AnyPublisher<Response<Digital>, Error> = requestAPI(url: API.getUsdDigital1.fullUrl)
        return publisher.map({$0.result}).eraseToAnyPublisher()
        
    }
 
    func getKhrSavings1() -> AnyPublisher<Saving, Error> {
        let publisher: AnyPublisher<Response<Saving>, Error> = requestAPI(url: API.getKhrSavings1.fullUrl)
        return publisher.map({$0.result}).eraseToAnyPublisher()
        
    }
    
    func getKhrFixed1() -> AnyPublisher<FixedDeposit, Error> {
        let publisher: AnyPublisher<Response<FixedDeposit>, Error> = requestAPI(url: API.getKhrFixed1.fullUrl)
        return publisher.map({$0.result}).eraseToAnyPublisher()
        
    }
    
    func getKhrDigital1() -> AnyPublisher<Digital, Error> {
        let publisher: AnyPublisher<Response<Digital>, Error> = requestAPI(url: API.getKhrDigital1.fullUrl)
        return publisher.map({$0.result}).eraseToAnyPublisher()
        
    }
    
    func getUsdSavings2() -> AnyPublisher<Saving, Error> {
        let publisher: AnyPublisher<Response<Saving>, Error> = requestAPI(url: API.getUsdSavings2.fullUrl)
        return publisher.map({$0.result}).eraseToAnyPublisher()
        
    }
    
    func getUsdFixed2() -> AnyPublisher<FixedDeposit, Error> {
        let publisher: AnyPublisher<Response<FixedDeposit>, Error> = requestAPI(url: API.getUsdFixed2.fullUrl)
        return publisher.map({$0.result}).eraseToAnyPublisher()
        
    }
    
    func getUsdDigital2() -> AnyPublisher<Digital, Error> {
        let publisher: AnyPublisher<Response<Digital>, Error> = requestAPI(url: API.getUsdDigital2.fullUrl)
        return publisher.map({$0.result}).eraseToAnyPublisher()
        
    }
    
    func getKhrSavings2() -> AnyPublisher<Saving, Error> {
        let publisher: AnyPublisher<Response<Saving>, Error> = requestAPI(url: API.getKhrSavings2.fullUrl)
        return publisher.map({$0.result}).eraseToAnyPublisher()
        
    }
    
    func getKhrFixed2() -> AnyPublisher<FixedDeposit, Error> {
        let publisher: AnyPublisher<Response<FixedDeposit>, Error> = requestAPI(url: API.getKhrFixed2.fullUrl)
        return publisher.map({$0.result}).eraseToAnyPublisher()
        
    }
    
    func getKhrDigital2() -> AnyPublisher<Digital, Error> {
        let publisher: AnyPublisher<Response<Digital>, Error> = requestAPI(url: API.getKhrDigital2.fullUrl)
        return publisher.map({$0.result}).eraseToAnyPublisher()
        
    }
    
    func getEmptyFavoriteList() -> AnyPublisher<Favorites, Error> {
        let publisher: AnyPublisher<Response<Favorites>, Error> = requestAPI(url: API.getEmptyFavoriteList.fullUrl)
        return publisher.map({$0.result}).eraseToAnyPublisher()
        
    }
    
    func getFavoriteList() -> AnyPublisher<Favorites, Error> {
        let publisher: AnyPublisher<Response<Favorites>, Error> = requestAPI(url: API.getFavoriteList.fullUrl)
        return publisher.map({$0.result}).eraseToAnyPublisher()
        
    }
    
    func getBanner() -> AnyPublisher<Banners, Error> {
        let publisher: AnyPublisher<Response<Banners>, Error> = requestAPI(url: API.getBanner.fullUrl)
        return publisher.map({$0.result}).eraseToAnyPublisher()
        
    }
    
}

enum NetworkError: Error {
    case urlError
}


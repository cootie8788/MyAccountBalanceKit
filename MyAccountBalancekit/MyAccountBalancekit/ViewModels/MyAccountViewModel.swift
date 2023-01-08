//
//  MyAccountViewModel.swift
//  MyAccountBalancekit
//
//  Created by Henry Lin on 2023/1/6.
//

import Foundation
import Combine

class MyAccountViewModel: BaseViewModel, ObservableObject{
    @Published private (set) var messagesList = [Notification]()
    @Published private (set) var bannerList = [Banner]()
    @Published private (set) var favoriteList = [Favorite]()
    @Published private (set) var usdTotalAmount:Double?
    @Published private (set) var khrTotalAmount:Double?
    
    func getEmptyNotificationList() {
        loadingEven = .loading
        APIManager.shared.getEmptyNotificationList()
            .sink { completion in
                if case .failure(let error) = completion {
                    self.errorMessage = error.localizedDescription
                    self.messagesList = []
                }
                self.loadingEven = .stop
            } receiveValue: {[weak self] data in
                guard let `self` = self else {return}
                self.messagesList = data.messages
            }
            .store(in: &cancellable)
    }
    
    func getNotificationList() {
        loadingEven = .loading
        APIManager.shared.getNotificationList()
            .sink { completion in
                if case .failure(let error) = completion {
                    self.errorMessage = error.localizedDescription
                }
                self.loadingEven = .stop
            } receiveValue: {[weak self] data in
                guard let `self` = self else {return}
                self.messagesList = data.messages
            }
            .store(in: &cancellable)
    }
    
    func getUsdTotalAmount1() {
        loadingEven = .loading
        Publishers.Zip3(APIManager.shared.getUsdSavings1(), APIManager.shared.getUsdFixed1(), APIManager.shared.getUsdDigital1()).sink(receiveCompletion: { completion in
            if case .failure(let error) = completion {
                self.errorMessage = error.localizedDescription
            }
            self.loadingEven = .stop
        }, receiveValue: { savings1, usdFixed1, getUsdDigital1 in
            var usdAccountList = [Account]()
            usdAccountList.append(contentsOf: savings1.savingsList)
            usdAccountList.append(contentsOf: usdFixed1.fixedDepositList)
            usdAccountList.append(contentsOf: getUsdDigital1.digitalList)
            let total = usdAccountList.reduce(0, {$0 + $1.balance})
            self.usdTotalAmount = total
        })
        .store(in: &cancellable)
    }
    
    func getKhrTotalAmount1() {
        loadingEven = .loading
        Publishers.Zip3(APIManager.shared.getKhrSavings1(), APIManager.shared.getKhrFixed1(), APIManager.shared.getKhrDigital1()).sink(receiveCompletion: { completion in
            if case .failure(let error) = completion {
                self.errorMessage = error.localizedDescription
            }
            self.loadingEven = .stop
        }, receiveValue: { savings1, usdFixed1, getUsdDigital1 in
            var khrAccountList = [Account]()
            khrAccountList.append(contentsOf: savings1.savingsList)
            khrAccountList.append(contentsOf: usdFixed1.fixedDepositList)
            khrAccountList.append(contentsOf: getUsdDigital1.digitalList)
            let total = khrAccountList.reduce(0, {$0 + $1.balance})
            self.khrTotalAmount = total
        })
        .store(in: &cancellable)
    }
    
    func getUsdTotalAmount2() {
        Publishers.Zip3(APIManager.shared.getUsdSavings2(), APIManager.shared.getUsdFixed2(), APIManager.shared.getUsdDigital2()).sink(receiveCompletion: { completion in
            if case .failure(let error) = completion {
                self.errorMessage = error.localizedDescription
            }
            self.loadingEven = .stop
        }, receiveValue: { savings1, usdFixed1, getUsdDigital1 in
            var usdAccountList = [Account]()
            usdAccountList.append(contentsOf: savings1.savingsList)
            usdAccountList.append(contentsOf: usdFixed1.fixedDepositList)
            usdAccountList.append(contentsOf: getUsdDigital1.digitalList)
            let total = usdAccountList.reduce(0, {$0 + $1.balance})
            self.usdTotalAmount = total
        })
        .store(in: &cancellable)
    }
    
    func getKhrTotalAmount2() {
        Publishers.Zip3(APIManager.shared.getKhrSavings2(), APIManager.shared.getKhrFixed2(), APIManager.shared.getKhrDigital2()).sink(receiveCompletion: { completion in
            if case .failure(let error) = completion {
                self.errorMessage = error.localizedDescription
            }
            self.loadingEven = .stop
        }, receiveValue: { savings1, usdFixed1, getUsdDigital1 in
            var khrAccountList = [Account]()
            khrAccountList.append(contentsOf: savings1.savingsList)
            khrAccountList.append(contentsOf: usdFixed1.fixedDepositList)
            khrAccountList.append(contentsOf: getUsdDigital1.digitalList)
            let total = khrAccountList.reduce(0, {$0 + $1.balance})
            self.khrTotalAmount = total
        })
        .store(in: &cancellable)
    }
    
    func getBunner() {
        loadingEven = .loading
        APIManager.shared.getBanner()
            .sink { completion in
                if case .failure(let error) = completion {
                    self.errorMessage = error.localizedDescription
                }
                self.loadingEven = .stop
            } receiveValue: {[weak self] data in
                guard let `self` = self else {return}
                self.bannerList = data.bannerList
                print("data.bannerList.count:\(data.bannerList.count)")
            }
            .store(in: &cancellable)
    }
    
    func getFavoriteList() {
        loadingEven = .loading
        APIManager.shared.getFavoriteList()
            .sink { completion in
                if case .failure(let error) = completion {
                    self.errorMessage = error.localizedDescription
                }
                self.loadingEven = .stop
            } receiveValue: {[weak self] data in
                guard let `self` = self else {return}
                self.favoriteList = data.favoriteList
                
            }
            .store(in: &cancellable)
    }
    
}

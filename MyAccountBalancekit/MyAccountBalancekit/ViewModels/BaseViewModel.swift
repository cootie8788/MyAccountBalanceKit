//
//  BaseViewModel.swift
//  MyAccountBalancekit
//
//  Created by Henry Lin on 2023/1/6.
//

import Foundation
import Combine

enum LoadingEven {
    case loading
    case stop
}

class BaseViewModel {
    @Published var errorMessage: String?
    @Published var loadingEven: LoadingEven = .stop
    var cancellable = Set<AnyCancellable>()
}

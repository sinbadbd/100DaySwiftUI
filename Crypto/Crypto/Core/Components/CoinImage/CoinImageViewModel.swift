//
//  CoinImageViewModel.swift
//  Crypto
//
//  Created by Imran on 1/4/22.
//

import Foundation
import SwiftUI
import Combine

class CoinImageViewModel: ObservableObject {
    @Published var image: UIImage? = nil
    @Published var isLoading: Bool = false
    
    private let coin: CoinModel
    private let dataService: CoinImageService
    private var cancellable = Set<AnyCancellable>()
    
    init(coin: CoinModel){
        self.coin = coin
        self.dataService = CoinImageService(coin: coin)
        self.isLoading = true
        addSubscribers()
    }
    
    func addSubscribers(){
        dataService.$image
            .sink { (_) in
                self.isLoading = false
            } receiveValue: { [weak self] img in
                self?.image = img
            }
            .store(in: &cancellable)

    }
}


//
//  HomeViewModel.swift
//  Crypto
//
//  Created by Imran on 30/3/22.
//

import Foundation
import Combine

class HomeVieModel: ObservableObject {
    
    @Published var allCoins: [CoinModel] = []
    @Published var protfolioCoins: [CoinModel] = []
    
    @Published var searchText: String = ""

    private let dataService = CoinDataService()
    private var cancellables = Set<AnyCancellable>()
    
    init(){
        addSubscriber()
    }
    
    func addSubscriber(){
        dataService.$allCoins
            .sink { [weak self] results in
                self?.allCoins = results
            }
            .store(in: &cancellables)

    }
}

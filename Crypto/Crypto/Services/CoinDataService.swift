//
//  CoinDataService.swift
//  Crypto
//
//  Created by Imran on 31/3/22.
//

import Foundation
import Combine

class CoinDataService {
    
    @Published var allCoins: [CoinModel] = []
    var coinSubscription: AnyCancellable?
    
    init(){
        getCoins()
    }
    
    private func getCoins(){
        
        guard let url = URL(string: Api.coins) else { return }
        
        coinSubscription =  NetworkingManager.download(url: url)
            .receive(on: DispatchQueue.main)
            .decode(type: [CoinModel].self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] coinResult in
                self?.allCoins = coinResult
                self?.coinSubscription?.cancel()
            })
    }
}

//"https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=250&page=1&sparkline=true&price_change_percentage=24h"

//
//  HomeViewModel.swift
//  Crypto
//
//  Created by Imran on 30/3/22.
//

import Foundation
import Combine

class HomeVieModel: ObservableObject {
    @Published var statistic: [StatisticModel] = []
    
    @Published var allCoins: [CoinModel] = []
    @Published var protfolioCoins: [CoinModel] = []
    
    @Published var searchText: String = ""
    
    private let coinDataService = CoinDataService()
    private let marketDataService = MarketdataService()
    private var cancellables = Set<AnyCancellable>()
    
    init(){
        addSubscriber()
    }
    
    func addSubscriber(){
        
        $searchText
            .combineLatest(coinDataService.$allCoins)
            .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)
            .map(filterCoins)
            .sink { [weak self](returnCoin) in
                self?.allCoins = returnCoin
            }
            .store(in: &cancellables)
        
        //  MARK: update market data
        marketDataService.$marketData
            .map(mapGlobalMarketData)
            .sink { [weak self] resultStats in
                self?.statistic  = resultStats
            }.store(in: &cancellables)
    }
    
    private func filterCoins(text: String, coins: [CoinModel]) -> [CoinModel] {
        guard !text.isEmpty else { return coins }
        
        let lowercaseText = text.lowercased()
        return coins.filter { coin in
            return coin.name.lowercased().contains(lowercaseText) ||
            coin.symbol.lowercased().contains(lowercaseText) ||
            coin.id.lowercased().contains(lowercaseText)
        }
    }
    
    private func mapGlobalMarketData(market: MarketDataModel?) -> [StatisticModel] {
        var stats: [StatisticModel] = []
        
        guard let data = market else { return stats }
        let marketCap = StatisticModel(title: "Market Cap", value: data.marketCap, percentageChage: data.marketCapChangePercentage24HUsd)
        let volume =  StatisticModel(title: "24h Volume", value: data.valume)
        let btcDominance = StatisticModel(title: "BTC Dominance", value: data.btcDominane)
        let portfolio = StatisticModel(title: "Portfolio Value", value: "$0.0", percentageChage: 0)
        
        stats.append(contentsOf: [
            marketCap,
            volume,
            btcDominance,
            portfolio
        ])
        return stats
    }
}


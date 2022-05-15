//
//  HomeViewModel.swift
//  Crypto
//
//  Created by Imran on 30/3/22.
//

import Foundation
import Combine
import SwiftUI


enum SortOption {
    case rank, rankReversed, holdings, holdingReserved, price, priceReversed
}



class HomeVieModel: ObservableObject {
    @Published var statistic: [StatisticModel] = []
    
    @Published var allCoins: [CoinModel] = []
    @Published var protfolioCoins: [CoinModel] = []
    @Published var searchText: String = ""
    @Published var sortingOption: SortOption = .holdings
    @State var isLoading: Bool = false
    
    private let coinDataService = CoinDataService()
    private let marketDataService = MarketdataService()
    private let portfolioDataService = PortfolioDataService()
    
    private var cancellables = Set<AnyCancellable>()
    
    init(){
        addSubscriber()
    }
    
    func addSubscriber(){
        
        $searchText
            .combineLatest(coinDataService.$allCoins, $sortingOption)
            .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)
            .map(filterAndSorting)
            .sink { [weak self](returnCoin) in
                self?.allCoins = returnCoin
            }
            .store(in: &cancellables)
        
        $allCoins
            .combineLatest(portfolioDataService.$saveEntities)
            .map { (coinModel, portfolioEntity) -> [CoinModel] in
                coinModel.compactMap { (coin) -> CoinModel? in
                    guard let entiry = portfolioEntity.first(where: {$0.coinID == coin.id }) else {
                        return nil
                    }
                    return coin.updateHolding(amount: entiry.amount)
                }
            }
            .sink {[weak self] resultCoin in
                self?.protfolioCoins = resultCoin
            }
            .store(in: &cancellables)
        
        //  MARK: update market data
        marketDataService.$marketData
            .combineLatest($protfolioCoins)
            .map(mapGlobalMarketData)
            .sink { [weak self] resultStats in
                self?.statistic  = resultStats
                self?.isLoading = false
            }.store(in: &cancellables)
    }
    
    func updatePortfolio(coin: CoinModel, amount: Double){
        portfolioDataService.updateCoin(coin: coin, amount: amount)
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
    
    private func filterAndSorting(text: String, coins: [CoinModel], sort: SortOption) -> [CoinModel] {
        var updateCoins =  filterCoins(text: text, coins: coins)
        //sort
        sortCoins(sort: sort, coins: &updateCoins )
        return updateCoins
    }
    
    private func sortCoins(sort: SortOption, coins: inout [CoinModel]){
        switch sort {
        case .rank, .holdings:
            coins.sort(by: { $0.rank < $1.rank })
        case .rankReversed, .holdingReserved:
            coins.sort(by: { $0.rank > $1.rank })
        case .price:
            coins.sort(by: { $0.currentPrice > $1.currentPrice })
        case .priceReversed:
            coins.sort(by: { $0.currentPrice < $1.currentPrice })
        }
    }
    
    
//    private func sortPortfolioCoinIfNeeded(coin: [CoinModel]) -> [CoinModel]{
//        // will only sort by holding of
//        switch sortingOption {
//        case .holdings:
////            return coin.sorted(by: { $0.})
//        default:
//            return coin
//            
//        }
//    }
    
    private func mapGlobalMarketData(market: MarketDataModel?, protfolioCoins: [CoinModel]) -> [StatisticModel] {
        var stats: [StatisticModel] = []
        
        guard let data = market else { return stats }
        let marketCap = StatisticModel(title: "Market Cap", value: data.marketCap, percentageChage: data.marketCapChangePercentage24HUsd)
        let volume =  StatisticModel(title: "24h Volume", value: data.valume)
        let btcDominance = StatisticModel(title: "BTC Dominance", value: data.btcDominane)
        
        let portfoiloValue = protfolioCoins
            .map({ $0.currentHoldingValue })
            .reduce(0, +)
        
        let previousValue = protfolioCoins.map { (coins) -> Double in
            let currentValue = coins.currentHoldingValue
            let percentChange = (coins.priceChangePercentage24H ?? 0.0) / 100
            let previousVaue = currentValue / (1 + percentChange)
            return previousVaue
        }
            .reduce(0, +)
        
        let portfolio = StatisticModel(
            title: "Portfolio Value",
            value: portfoiloValue.asCurrencyWith2Decimals(),
            percentageChage: previousValue
        )
        
        stats.append(contentsOf: [
            marketCap,
            volume,
            btcDominance,
            portfolio
        ])
        return stats
    }
    
    func reloadApiCall(){
        isLoading = true
        coinDataService.getCoins()
        marketDataService.getData()
        HapticManager.notification(type: .success)
        print("Reload data...")
    }
}


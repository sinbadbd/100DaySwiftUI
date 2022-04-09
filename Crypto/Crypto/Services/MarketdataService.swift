//
//  MarketdataService.swift
//  Crypto
//
//  Created by Imran on 9/4/22.
//

import Foundation
import Foundation
import Combine

class MarketdataService {
    
    @Published var marketData: MarketDataModel? = nil
    var marketDataSubscription: AnyCancellable?
    
    init(){
        getData()
    }
    
    private func getData(){
        
        guard let url = URL(string: Api.global) else { return }
        
        marketDataSubscription =  NetworkingManager.download(url: url)
            .receive(on: DispatchQueue.main)
            .decode(type: GlobalData.self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] globalResult in
                self?.marketData = globalResult.data
                self?.marketDataSubscription?.cancel()
            })
    }
}

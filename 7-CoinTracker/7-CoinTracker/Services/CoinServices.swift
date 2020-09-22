//
//  CoinServices.swift
//  7-CoinTracker
//
//  Created by Imran on 22/9/20.
//

import Foundation
import Combine

final class CoinServices {
    let url = URL(string: "https://api.coinranking.com/v1/public/coins?base=USD&timePeriod=7d&symbols=btc,eth,usdt,xro,bch,ada,itc,cro")
    
    let symbols = ["btc","eth","xro","bch","ada","itc","cro"]
    
    lazy var urlComonents : URLComponents = {
        var components    = URLComponents()
        components.scheme = "https"
        components.host   = "https://api.coinranking.com"
        components.path   = "v1/public/coins"
        
        components.queryItems = [
            URLQueryItem(name: "base", value: "USD"),
            URLQueryItem(name: "timePeriod", value: "7d"),
            URLQueryItem(name: "sysmbols", value: symbols.joined(separator: ","))
        ]
        
        return components
    }()
    
    
    
    func getCoins () -> AnyPublisher<CoinResponse, Error>? {
        guard let url = urlComonents.url else { return nil}
        print(url)
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: CoinResponse.self, decoder: JSONDecoder())
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
    }
}

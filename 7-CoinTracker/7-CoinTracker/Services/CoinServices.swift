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
}



struct CoinResponse : Decodable {
    let status      : String?
    let data        : CoinData
}
struct CoinData     : Decodable {
    let coin        : [Coin]
}
struct Coin         : Decodable {
    let name        : String
    let price       : String
    let symbol      : String
    let color       : String
    let change      : String
    let history     : [String]
}

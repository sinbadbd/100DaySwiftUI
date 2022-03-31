//
//  Api + URL.swift
//  Crypto
//
//  Created by Imran on 31/3/22.
//

import Foundation


struct Api {
    
    static public var shared = Api()
    
    private let BASE_URL = "https://api.coingecko.com/api/v3/"
    
    public let coins = Api.shared.BASE_URL + "coins/markets?vs_currency=usd&order=market_cap_desc&per_page=250&page=1&sparkline=true&price_change_percentage=24h"
}



//"https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=250&page=1&sparkline=true&price_change_percentage=24h

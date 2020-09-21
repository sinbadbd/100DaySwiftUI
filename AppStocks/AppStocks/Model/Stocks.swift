//
//  Stocks.swift
//  AppStocks
//
//  Created by Imran on 20/9/20.
//

import Foundation

struct Stocks: Decodable {
    let symbol: String
    let description: String
    let price: Double
    let change: String
}
/*
 
 "symbol": "GOOG",
 "description": "Google Innovation Media",
 "price": 1000,
 "change": "-0.24"
 
 */

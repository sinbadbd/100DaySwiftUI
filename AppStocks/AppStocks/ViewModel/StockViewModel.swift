//
//  StockViewModel.swift
//  AppStocks
//
//  Created by Imran on 20/9/20.
//

import Foundation

struct StockViewModel {
    
    let stock : Stocks
    
    var symbol : String {
        return self.stock.symbol.uppercased()
    }
    var description: String {
        return self.stock.description
    }
    var price : String {
        return String(format: "%.2f", self.stock.price)
    }
    var change : String {
        return self.stock.change
    }
    
}

/*
 
 "symbol": "GOOG",
 "description": "Google Innovation Media",
 "price": 1000,
 "change": "-0.24"
 
 */

//
//  CoinModel.swift
//  Crypto
//
//  Created by Imran on 28/3/22.
//

import Foundation
 
 
struct CoinModel: Identifiable, Codable {

      var id                                 : String?        = nil
      var symbol                             : String?        = nil
      var name                               : String?        = nil
      var image                              : Double?        = nil
      var currentPrice                       : Int?           = nil
      var marketCap                          : Int?           = nil
      var marketCapRank                      : Int?           = nil
      var fullyDilutedValuation              : Int?           = nil
      var totalVolume                        : Int?           = nil
      var high24h                            : Int?           = nil
      var low24h                             : Int?           = nil
      var priceChange24h                     : Double?        = nil
      var priceChangePercentage24h           : Double?        = nil
      var marketCapChange24h                 : Int?           = nil
      var marketCapChangePercentage24h       : Double?        = nil
      var circulatingSupply                  : Int?           = nil
      var totalSupply                        : Int?           = nil
      var maxSupply                          : Int?           = nil
      var ath                                : Int?           = nil
      var athChangePercentage                : Double?        = nil
      var athDate                            : String?        = nil
      var atl                                : Double?        = nil
      var atlChangePercentage                : Double?        = nil
      var atlDate                            : String?        = nil
      var roi                                : String?        = nil
      var lastUpdated                        : String?        = nil
      var sparklineIn7d                      : SparklineIn7d? = SparklineIn7d()
      var priceChangePercentage24hInCurrency : Double?        = nil
      var currentHoldings                    : Double?        = 0
        
      enum CodingKeys: String, CodingKey {

        case id                                 = "id"
        case symbol                             = "symbol"
        case name                               = "name"
        case image                              = "image"
        case currentPrice                       = "current_price"
        case marketCap                          = "market_cap"
        case marketCapRank                      = "market_cap_rank"
        case fullyDilutedValuation              = "fully_diluted_valuation"
        case totalVolume                        = "total_volume"
        case high24h                            = "high_24h"
        case low24h                             = "low_24h"
        case priceChange24h                     = "price_change_24h"
        case priceChangePercentage24h           = "price_change_percentage_24h"
        case marketCapChange24h                 = "market_cap_change_24h"
        case marketCapChangePercentage24h       = "market_cap_change_percentage_24h"
        case circulatingSupply                  = "circulating_supply"
        case totalSupply                        = "total_supply"
        case maxSupply                          = "max_supply"
        case ath                                = "ath"
        case athChangePercentage                = "ath_change_percentage"
        case athDate                            = "ath_date"
        case atl                                = "atl"
        case atlChangePercentage                = "atl_change_percentage"
        case atlDate                            = "atl_date"
        case roi                                = "roi"
        case lastUpdated                        = "last_updated"
        case sparklineIn7d                      = "sparkline_in_7d"
        case priceChangePercentage24hInCurrency = "price_change_percentage_24h_in_currency"
        case currentHoldings
      }
    
    func updateHolding(amount: Double) -> CoinModel{
        return CoinModel(id: id, symbol: symbol, name: name, image: image, currentPrice: currentPrice, marketCap: marketCap, marketCapRank: marketCapRank, fullyDilutedValuation: fullyDilutedValuation, totalVolume: totalVolume, high24h: high24h, low24h: low24h, priceChange24h: priceChange24h, priceChangePercentage24h: priceChangePercentage24h, marketCapChange24h: marketCapChange24h, marketCapChangePercentage24h: marketCapChangePercentage24h, circulatingSupply: circulatingSupply, totalSupply: totalSupply, maxSupply: maxSupply, ath: ath, athChangePercentage: athChangePercentage, athDate: athDate, atl: atl, atlChangePercentage: atlChangePercentage, atlDate: atlDate, roi: roi, lastUpdated: lastUpdated, sparklineIn7d: sparklineIn7d, priceChangePercentage24hInCurrency: priceChangePercentage24hInCurrency, currentHoldings: amount)
    }
    
    
}

struct SparklineIn7d: Codable {

  var price : [Double]? = []

  enum CodingKeys: String, CodingKey {

    case price = "price"
  
  }
}

///
/*
 https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=250&page=1&sparkline=true&price_change_percentage=24h
 
 {
     "id": "bitcoin",
     "symbol": "btc",
     "name": "Bitcoin",
     "image": "https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1547033579",
     "current_price": 47655,
     "market_cap": 905276725699,
     "market_cap_rank": 1,
     "fully_diluted_valuation": 1000764583083,
     "total_volume": 32010701847,
     "high_24h": 47664,
     "low_24h": 44698,
     "price_change_24h": 2950.38,
     "price_change_percentage_24h": 6.59965,
     "market_cap_change_24h": 58565169192,
     "market_cap_change_percentage_24h": 6.91678,
     "circulating_supply": 18996287,
     "total_supply": 21000000,
     "max_supply": 21000000,
     "ath": 69045,
     "ath_change_percentage": -30.96593,
     "ath_date": "2021-11-10T14:24:11.849Z",
     "atl": 67.81,
     "atl_change_percentage": 70192.16905,
     "atl_date": "2013-07-06T00:00:00.000Z",
     "roi": null,
     "last_updated": "2022-03-28T15:24:20.575Z",
     "sparkline_in_7d": {
     "price": [ ]
    },
    "price_change_percentage_24h_in_currency": 6.59965123039629
 }
 */

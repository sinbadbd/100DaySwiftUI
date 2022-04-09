//
//  MarketDataModel.swift
//  Crypto
//
//  Created by Imran on 9/4/22.
//

import Foundation

struct GlobalData: Codable {
    let data: MarketDataModel?
}

struct MarketDataModel: Codable {
    let activeCryptocurrencies, upcomingIcos, ongoingIcos, endedIcos: Int?
    let markets: Int?
    let totalMarketCap, totalVolume, marketCapPercentage: [String: Double]?
    let marketCapChangePercentage24HUsd: Double?
    let updatedAt: Int?

    enum CodingKeys: String, CodingKey {
        case activeCryptocurrencies = "active_cryptocurrencies"
        case upcomingIcos = "upcoming_icos"
        case ongoingIcos = "ongoing_icos"
        case endedIcos = "ended_icos"
        case markets
        case totalMarketCap = "total_market_cap"
        case totalVolume = "total_volume"
        case marketCapPercentage = "market_cap_percentage"
        case marketCapChangePercentage24HUsd = "market_cap_change_percentage_24h_usd"
        case updatedAt = "updated_at"
    }
    
    var marketCap: String {
        if let item = totalMarketCap?.first(where: {$0.key == "usd"}) {
            return "$" + item.value.formattedWithAbbreviations()
        }
        return ""
    }
    
    var valume: String {
        if let item = totalVolume?.first(where: { $0.key == "usd"}){
            return "$" + item.value.formattedWithAbbreviations()
        }
        return ""
    }
    var btcDominane: String {
        if let item = marketCapPercentage?.first(where: { $0.key == "btc"}){
            return "\(item.value.asPercentString())"
        }
        return ""
    }
}



/*
 {
   "data": {
     "active_cryptocurrencies": 13614,
     "upcoming_icos": 0,
     "ongoing_icos": 49,
     "ended_icos": 3376,
     "markets": 788,
     "total_market_cap": {
       "btc": 48599026.80445987,
       "eth": 643126656.5590394,
       "ltc": 18541166994.42593,
       "bch": 6362517119.527012,
       "bnb": 4860595633.4663315,
       "eos": 853570312812.4185,
       "xrp": 2709355976685.887,
       "xlm": 10078184439613.795,
       "link": 134630713292.7534,
       "dot": 104868277519.51587,
       "yfi": 100533244.45121276,
       "usd": 2064626332157.5388,
       "aed": 7583372518014.62,
       "ars": 231611379962213.56,
       "aud": 2767596499609.5317,
       "bdt": 178210433074979.4,
       "bhd": 778624270141.2424,
       "bmd": 2064626332157.5388,
       "brl": 9702917910607.562,
       "cad": 2595297238311.988,
       "chf": 1931201920068.1912,
       "clp": 1682670460708395.2,
       "cny": 13141553066815.95,
       "czk": 46384927491417.3,
       "dkk": 14118534247192.871,
       "eur": 1898244289927.9602,
       "gbp": 1583861573703.9976,
       "hkd": 16185152943760.947,
       "huf": 717384356189951.9,
       "idr": 29670022400219740,
       "ils": 6652700906267.976,
       "inr": 156741269571569.75,
       "jpy": 256684648759903.03,
       "krw": 2537745779303098.5,
       "kwd": 629657351023.4111,
       "lkr": 651452898915914.9,
       "mmk": 3829110159026569,
       "mxn": 41369093310678.81,
       "myr": 8715820061203.069,
       "ngn": 858161934961281.2,
       "nok": 17979893386405.18,
       "nzd": 3014823115127.405,
       "php": 106534712545449.75,
       "pkr": 384588270022645.3,
       "pln": 8796802964455.61,
       "rub": 166925216512801.34,
       "sar": 7743523517973.746,
       "sek": 19509149722876.28,
       "sgd": 2815118003896.801,
       "thb": 69343504172340.09,
       "try": 30451380235624.74,
       "twd": 59681533995778.17,
       "uah": 60725427650954.19,
       "vef": 206731034638.9341,
       "vnd": 47202248105238696,
       "zar": 30262673388865.535,
       "xdr": 1488994058367.6929,
       "xag": 83319936382.96965,
       "xau": 1060103036.5096078,
       "bits": 48599026804459.87,
       "sats": 4859902680445987
     },
     "total_volume": {
       "btc": 2366727.5122775063,
       "eth": 31319671.442837283,
       "ltc": 902937629.0187874,
       "bch": 309848680.1949566,
       "bnb": 236706497.3968779,
       "eos": 41568082240.09703,
       "xrp": 131943122161.19386,
       "xlm": 490798231063.5928,
       "link": 6556390818.8849535,
       "dot": 5106987812.106032,
       "yfi": 4895875.72398405,
       "usd": 100545386691.59985,
       "aed": 369303205318.2453,
       "ars": 11279259301192.96,
       "aud": 134779381588.51575,
       "bdt": 8678682736394.574,
       "bhd": 37918279501.45621,
       "bmd": 100545386691.59985,
       "brl": 472523099295.8424,
       "cad": 126388567432.94162,
       "chf": 94047741622.04196,
       "clp": 81944490153653.94,
       "cny": 639981440830.7021,
       "czk": 2258902930106.8257,
       "dkk": 687559517813.166,
       "eur": 92442735614.28395,
       "gbp": 77132589037.36725,
       "hkd": 788201930802.9235,
       "huf": 34935952514103.336,
       "idr": 1444902561259639.8,
       "ils": 323980361359.2733,
       "inr": 7633154394159.522,
       "jpy": 12500304227153.805,
       "krw": 123585864778913.38,
       "kwd": 30663728760.883873,
       "lkr": 31725151720028.746,
       "mmk": 186474111865915.53,
       "mxn": 2014636459497.4539,
       "myr": 424452349918.5898,
       "ngn": 41791689978363.49,
       "nok": 875604125091.584,
       "nzd": 146819088372.5147,
       "php": 5188141651650.38,
       "pkr": 18729091905977.75,
       "pln": 428396142166.1807,
       "rub": 8129103160919.092,
       "sar": 377102410418.52594,
       "sek": 950077489741.732,
       "sgd": 137093634753.99623,
       "thb": 3376964312119.652,
       "try": 1482953962853.0745,
       "twd": 2906435329478.062,
       "uah": 2957271981897.8237,
       "vef": 10067609569.429882,
       "vnd": 2298705685640711,
       "zar": 1473764114509.4622,
       "xdr": 72512629064.27502,
       "xag": 4057603592.602999,
       "xau": 51626034.25066876,
       "bits": 2366727512277.5063,
       "sats": 236672751227750.62
     },
     "market_cap_percentage": {
       "btc": 39.10935928094711,
       "eth": 18.693691341106803,
       "usdt": 3.998222645872776,
       "bnb": 3.4563302864767236,
       "usdc": 2.465008285532892,
       "xrp": 1.775047147968055,
       "sol": 1.7560224965172944,
       "luna": 1.6320183151144967,
       "ada": 1.6148442386857573,
       "avax": 1.0937219529394582
     },
     "market_cap_change_percentage_24h_usd": -2.3943335606274485,
     "updated_at": 1649493550
   }
 }
 */

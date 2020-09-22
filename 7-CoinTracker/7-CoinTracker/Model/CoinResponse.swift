//
//  CoinResponse.swift
//  7-CoinTracker
//
//  Created by Imran on 22/9/20.
//

import Foundation

struct CoinResponse : Decodable {
    let status      : String?
    let data        : CoinData
}

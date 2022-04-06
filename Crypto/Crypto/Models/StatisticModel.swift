//
//  StatisticModel.swift
//  Crypto
//
//  Created by Imran on 6/4/22.
//

import Foundation

struct StatisticModel: Identifiable {
    let id = UUID().uuidString
    let title: String
    let value: String
    let percentageChage: Double?
    
    init(title: String, value: String, percentageChage: Double? = nil) {
        self.title = title
        self.value = value
        self.percentageChage = percentageChage
    }
}



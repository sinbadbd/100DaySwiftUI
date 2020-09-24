//
//  CoinListViewModel.swift
//  7-CoinTracker
//
//  Created by Imran on 22/9/20.
//

import Foundation
import  Combine
class CoinListViewModel: ObservableObject {
    
    @Published var coins = [CoinViewModel]()
    
    private let coinService = CoinServices()
    
    var cancellable : AnyCancellable?
    
    func getCoins(){
        guard let getCoins = coinService.getCoins() else {
            print("no data")
            return
        }
        
        cancellable = getCoins.sink(receiveCompletion: { err in
            print(err)
        }, receiveValue: { coinRes in
            self.coins = coinRes.data.coins.map{CoinViewModel($0)}
        })
    }
}

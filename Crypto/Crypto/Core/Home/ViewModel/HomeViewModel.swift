//
//  HomeViewModel.swift
//  Crypto
//
//  Created by Imran on 30/3/22.
//

import Foundation

class HomeVieModel: ObservableObject {
    
    @Published var allCoins: [CoinModel] = []
    @Published var protfolioCoins: [CoinModel] = []
    
    init(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0, execute: { [weak self] in
            self?.allCoins.append(DeveloperPreview.instance.coin)
            self?.protfolioCoins.append(DeveloperPreview.instance.coin)
        })
    }
    
}

//
//  StockListViewModel.swift
//  AppStocks
//
//  Created by Imran on 20/9/20.
//

import Foundation

class StockListViewModel : ObservableObject{
    var searchString:String = ""
   @Published var stocks : [StockViewModel] = [StockViewModel]()
    
    func load(){
        fetchStock()
    }
    
    func fetchStock(){
//        WebService.getStocks{ stocks in
//            if let stocks = stocks {
//                self.stocks = stocks.map(StockViewModel.init())
//            }
//
//        }
    }
}

//
//  WebService.swift
//  AppStocks
//
//  Created by Imran on 20/9/20.
//

import Foundation

class WebService{
    
    func getStocks(completion: @escaping (([Stocks]?) -> Void )){
        guard let url = URL(string: "https://island-bramble.glitch.me/stocks") else {
            fatalError("Invalid Api")
        }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data, error == nil else {
                completion(nil)
                return
            }
            let stocks =  try? JSONDecoder().decode([Stocks].self, from: data)
            stocks == nil ? completion(nil) : completion(stocks)
             
        }.resume()
    }
}

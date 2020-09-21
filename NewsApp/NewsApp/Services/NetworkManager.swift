//
//  NetworkManager.swift
//  NewsApp
//
//  Created by Imran on 21/9/20.
//

import Foundation
class NetworkManager {
    let baseString = "http://newsapi.org/v2/"
    let topHeadLine = "top-headlines?country=us"
    
    func getNews(completion: @escaping (([News]?) -> Void )){
        let urlString = "\(baseString)\(topHeadLine)&apiKey=\(Api.key)"
        
        guard let url = URL(string: urlString) else {
            completion(nil)
            return
        }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard error == nil, let data = data  else {
                completion(nil)
                return
            }
            let newsResponse = try? JSONDecoder().decode(NewsEnvelope.self, from: data)
            newsResponse == nil ? completion(nil): completion(newsResponse?.articles)
        }.resume()
    }
}

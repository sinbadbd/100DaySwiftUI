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
    
    func getNews(completion: @escaping([News]?, Error?)-> Void){
        let urlString = "\(baseString)\(topHeadLine)&apiKey=\(Api.key)"
        
        
        guard let url = URL(string: urlString) else {
//            completion(nil, Error)
            return
        }
        
        taskForGETRequest(url: url, response: NewsEnvelope.self) { (response, error) in
            if let response = response {
                
                completion(response.articles,error)
            }else {
                completion([], error)
            }
        }
    }
    
    
    func taskForGETRequest<ResponseType: Decodable>(url : URL, response: ResponseType.Type, completion: @escaping (ResponseType?, Error?)-> Void) {
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else {
                DispatchQueue.main.async {
                    completion(nil, error)
                }
                return
            }
            
            let decoder = JSONDecoder()
            do {
                let responseObject = try decoder.decode(ResponseType.self, from: data)
                completion(responseObject, nil)
                
                decoder.keyDecodingStrategy = .convertFromSnakeCase
            } catch {
                DispatchQueue.main.sync {
                    completion(nil, error)
                }
            }
        }
        task.resume()
    }
}

//
//  NetworkManager.swift
//  WeatherSwiftUI
//
//  Created by Imran on 17/5/21.
//

import Foundation

final class NetworkManager<T: Codable>{
    
//    static let shared = NetworkManager()
    
    static func fetch(for url: URL, completion:@escaping(Result<T, NetworkingError>) -> Void) {
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            guard error == nil else {
                print(String(describing: error!))
                completion(.failure(.error(err: error!.localizedDescription)))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                completion(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completion(.failure(.invalidData))
                return
            }
            
            do {
                let json = try JSONDecoder().decode(T.self, from: data)
                completion(.success(json))
                
            }catch (let err){
                print(String(describing: err))
                completion(.failure(NetworkingError.decodingError(err: err.localizedDescription)))
            }
        }
    }
}


enum NetworkingError: Error {
    case invalidResponse
    case invalidData
    case error(err: String)
    case decodingError(err: String)
}

//
//  NetworkManager.swift
//  MovieDB-SwiftUI-Combine
//
//  Created by Imran on 1/2/21.
//

import Foundation
import Alamofire

final class NetworkManager <T: Codable> {
    static func fetch(from urlString:String, completion: @escaping (Result<T, NetworkError>) -> Void){
        AF.request(urlString).responseDecodable (of: T.self){ (resp) in
            if resp.error != nil {
                completion(.failure(.invalidResponse))
                print(resp.error!)
                return
            }
            if let payload = resp.value {
                completion(.success(payload))
            }
            completion(.failure(.nilResponse))
        }
    }
}
enum NetworkError:Error {
    case invalidResponse
    case nilResponse
}

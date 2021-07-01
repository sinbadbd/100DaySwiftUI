//
//  PresonManager.swift
//  MovieDB-SwiftUI-Combine
//
//  Created by Imran on 21/5/21.
//

import Foundation

class PersonManager: ObservableObject {
    
    @Published private var person : MoviePersonResponse?
    
    
//      private var cast : Cast
////
////    init(cast:Cast) {
////         self.cast = cast
////    }
//    
//    private var personRes : MoviePersonResponse
//    
//    init(persons: MoviePersonResponse) {
//        self.personRes = persons
//    }
    
    func getPersonData(id: Int){
        getPersonData(id: id)
    }
    private  func getPersonData(id: Int, for cast: MovieResponse){
        let urlString = "\(API.BASE_URL)person/\(id)?api_key=\(API.API_KEY)"
        print("urlString: \(urlString)")
        NetworkManager<MoviePersonResponse>.fetch(from: urlString) { (result) in
            switch result {
            
            case .success(let response):
                print("Respnse::\(response)")
                self.person = response
                print("persion: \(self.person)")
            case .failure(let err):
                print(err)
            }
        }
    }
    
    
}

//
//  MovieDetailsVM.swift
//  MovieDB-SwiftUI
//
//  Created by Imran on 27/9/20.
//  Copyright © 2020 portonics. All rights reserved.
//

import Foundation

class MovieDetailsVM: ObservableObject {
    
    @Published var details : MovieDetailsViewModel?
    
    
//    func load(id: Int){
//        getMovieDetails(id: id)
//    }
    func getMovieDetails(id: Int){
        APIClient.getMovieId(id: id) { (response, error) in
            guard let response = response else { return }
            
//            let details = re
         //   self.details = response
            
//            DispatchQueue.main.async {
//                self.details = details
//            }
        }
    }
}

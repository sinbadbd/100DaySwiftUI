//
//  PopularMovieModelVM.swift
//  MovieDB-SwiftUI
//
//  Created by Imran on 27/9/20.
//  Copyright © 2020 portonics. All rights reserved.
//

import SwiftUI

class TopRatedMovieModelVM: ObservableObject {
    
    @Published var topRated = [MovieResultViewModel]()
    
    func load(){
        getPoplarMovie()
    }
    func getPoplarMovie(){
        APIClient.getTopRatedMovieList { (response, error) in
            guard let response = response else { return }
            let topRatedResponse = response.map(MovieResultViewModel.init)
            DispatchQueue.main.async {
                self.topRated = topRatedResponse
            }
        }
    }
}

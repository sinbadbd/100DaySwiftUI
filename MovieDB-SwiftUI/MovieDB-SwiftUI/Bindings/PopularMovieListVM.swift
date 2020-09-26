//
//  PopularMovieListVM.swift
//  MovieDB-SwiftUI
//
//  Created by Imran on 27/9/20.
//  Copyright © 2020 portonics. All rights reserved.
//

import Foundation

class PopularMovieListVM: ObservableObject {
    
    @Published var popular = [MovieResultViewModel]()
    
    func load(){
        getPoplarMovie()
    }
    func getPoplarMovie(){
        APIClient.getPopularMovieList { (response, error) in
            guard let response = response else { return }
            let popularResponse = response.map(MovieResultViewModel.init)
            DispatchQueue.main.async {
                self.popular = popularResponse
            }
        }
    }
    
}

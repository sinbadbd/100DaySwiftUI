//
//  UpcommingMovieListVM.swift
//  MovieDB-SwiftUI
//
//  Created by Imran on 27/9/20.
//  Copyright © 2020 portonics. All rights reserved.
//

import Foundation

class UpcommingMovieListVM: ObservableObject {
    @Published var upcomming = [MovieResultViewModel]()
    
    func load(){
        getUpCommingMovie()
    }
    func getUpCommingMovie(){
        APIClient.getUpcomingMovies { (response, error) in
            guard let response = response else { return }
            let upcomminData = response.map(MovieResultViewModel.init)
            DispatchQueue.main.async {
                self.upcomming = upcomminData
                print(self.upcomming)
            }
        }
    }
}

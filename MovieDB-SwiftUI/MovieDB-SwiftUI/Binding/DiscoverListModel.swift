//
//  DiscoverListModel.swift
//  MovieDB-SwiftUI
//
//  Created by Imran on 26/9/20.
//  Copyright © 2020 portonics. All rights reserved.
//

import Foundation
class DiscoverListModel : ObservableObject{
    @Published var discover = [MovieResultViewModel]()
    
    func load(){
        getDiscover()
    }
    func getDiscover(){
        APIClient.getDiscoverMovieList { (response, error) in
            guard let response = response else { return }
            let discoverResponse = response.map(MovieResultViewModel.init)
            DispatchQueue.main.async {
                self.discover = discoverResponse
            }
        }
    }
}

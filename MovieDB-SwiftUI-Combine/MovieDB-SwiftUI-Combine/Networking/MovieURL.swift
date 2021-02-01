//
//  MovieURL.swift
//  MovieDB-SwiftUI-Combine
//
//  Created by Imran on 1/2/21.
//

import Foundation

enum MovieURL:String {
    case nowPlaying = "now_playing"
    case upcomming = "upcoming"
    case populur = "popular"
    
    public var urlString: String {
//        "\(API.BASE_URL)\(self.rawValue)??api_key=\(API.API_KEY)&language"
        "\(API.BASE_URL)?api_key=\(API.API_KEY)&language"
    }
}

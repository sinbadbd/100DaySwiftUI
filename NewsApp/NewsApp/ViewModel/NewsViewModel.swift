//
//  NesViewModel.swift
//  NewsApp
//
//  Created by Imran on 21/9/20.
//

import Foundation
struct NewsViewModel {
    
    let news : News
    
    var author: String {
        return news.author ?? ""
    }
    
    var title: String {
        return news.title ?? ""
    }
    var description: String {
        return news.description ?? ""
    }
    var  urlToImage: String {
        return news.urlToImage ?? ""
    }
    var  url: String {
        return news.url ?? ""
    }
}



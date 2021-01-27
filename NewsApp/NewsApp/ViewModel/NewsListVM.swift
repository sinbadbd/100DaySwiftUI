//
//  NewsListVM.swift
//  NewsApp
//
//  Created by Imran on 21/9/20.
//

import Foundation
class NewsListVM : ObservableObject {
    
    @Published var news = [NewsViewModel]()
    
    func load(){
        getNews()
    }
    func getNews(){
        let networkManager = NetworkManager()
        networkManager.getNews { (newsArticles, error) in
            guard let news = newsArticles else { return }
            
            let newsVM = news.map(NewsViewModel.init)
            
            DispatchQueue.main.async {
                self.news = newsVM
            }
        }
    }
}

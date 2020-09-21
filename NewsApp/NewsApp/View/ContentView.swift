//
//  ContentView.swift
//  NewsApp
//
//  Created by Imran on 20/9/20.
//

import SwiftUI
///http://newsapi.org/v2/everything?q=bitcoin&from=2020-08-21&sortBy=publishedAt&apiKey=93e7c1cb68e645af811768ef5551ef42


struct ContentView: View {
    
    @ObservedObject private var newsList = NewsListVM()
    
    init() {
        newsList.load()
    }
    
    var body: some View {
        VStack {
            NewsListView(newsCollection: self.newsList.news)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

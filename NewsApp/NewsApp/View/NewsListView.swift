//
//  NewsListView.swift
//  NewsApp
//
//  Created by Imran on 22/9/20.
//

import SwiftUI

struct NewsListView: View {
    
    let  newsCollection : [NewsViewModel]
    
    var body: some View {
        List (self.newsCollection, id:\.url) { news in
             NewsCell(news: news)
        }
    }
}

//struct NewsListView_Previews: PreviewProvider {
//    static var previews: some View {
//        NewsListView()
//    }
//}

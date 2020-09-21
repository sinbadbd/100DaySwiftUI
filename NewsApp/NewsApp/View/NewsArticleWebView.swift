//
//  NewsArticleWebView.swift
//  NewsApp
//
//  Created by Imran on 22/9/20.
//

import SwiftUI

struct NewsArticleWebView: View {
    var newsUrl : String
    var body: some View {
        SwiftUIWebView(urlString: newsUrl).padding(.top, 20)
    }
}

//struct NewsArticleWebView_Previews: PreviewProvider {
//    static var previews: some View {
//        NewsArticleWebView()
//    }
//}

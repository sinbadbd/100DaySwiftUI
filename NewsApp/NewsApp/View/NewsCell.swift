//
//  NewsCell.swift
//  NewsApp
//
//  Created by Imran on 22/9/20.
//

import SwiftUI
//import KingfisherSwi
//import struct Kingfisher.KFImage
import SDWebImageSwiftUI

struct NewsCell: View {
    
    let news : NewsViewModel

    @State private var isPresent:Bool = false
    
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10){
            Text(news.author).font(.title2).foregroundColor(.blue)
            WebImage(url: URL(string: news.urlToImage))
                .resizable()
                .aspectRatio(contentMode: .fill)
            Text(news.title).font(.caption)
            Text(news.description)
//            Text(news.url)
          
          

            
        }.padding(.bottom,10)
        .sheet(isPresented: $isPresent){
            NewsArticleWebView(newsUrl: news.url)
        }
        .onTapGesture{
            self.isPresent.toggle()
        }
        
    }
}

//struct NewsCell_Previews: PreviewProvider {
//    static var previews: some View {
//        NewsCell()
//    }
//}

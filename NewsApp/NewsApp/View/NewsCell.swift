//
//  NewsCell.swift
//  NewsApp
//
//  Created by Imran on 22/9/20.
//

import SwiftUI

struct NewsCell: View {
    
    let news : NewsViewModel

    @State private var isPresent:Bool = false
    
    
    var body: some View {
        VStack{
            Text(news.author).font(.title).foregroundColor(.blue)
            
            Text(news.title).font(.caption)
            Text(news.description)
            Text(news.url)
        }
    }
}

//struct NewsCell_Previews: PreviewProvider {
//    static var previews: some View {
//        NewsCell()
//    }
//}

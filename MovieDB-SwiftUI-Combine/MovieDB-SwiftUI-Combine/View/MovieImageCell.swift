//
//  MovieImageCell.swift
//  MovieDB-SwiftUI-Combine
//
//  Created by Imran on 2/2/21.
//

import SwiftUI

struct MovieImageCell: View {
    var movie : Movie
    var body: some View {
        VStack{
            AsyncImage(url: URL(string: movie.posterPath)!) {
                Rectangle()
                    .foregroundColor(Color.gray.opacity(0.5))
                
            } image: { (img) -> Image in
                Image(uiImage: img)
                    .resizable()
            }
            .frame(width: 100, height: 160)
            .animation(.easeOut(duration: 0.5))
            .transition(.opacity)
            .scaledToFit()
            .cornerRadius(15)
            .shadow(radius: 15)
            
            Text(movie.title ?? "")
        }
    }
}

//struct MovieImageCell_Previews: PreviewProvider {
//    static var previews: some View {
//        MovieImageCell()
//    }
//}

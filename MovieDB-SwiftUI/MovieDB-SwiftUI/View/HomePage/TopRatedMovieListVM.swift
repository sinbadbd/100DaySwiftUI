//
//  TopRatedMovieListVM.swift
//  MovieDB-SwiftUI
//
//  Created by Imran on 27/9/20.
//  Copyright © 2020 portonics. All rights reserved.
//

import SwiftUI

struct TopRatedMovieListVM: View {
    let topRated : [MovieResultViewModel]
    
    var body: some View {
        HStack {
            Text("Top Rated Movie").font(.title)
            Spacer(minLength: 0)
            Button(action: {}) {
                Image(systemName: "chevron.right.2")
                    .renderingMode(.original)
                    .frame(width: 30, height: 30)
            }
        }.padding(.vertical,10)
        .padding(.horizontal,20)
        .border(Color.gray, width: 0.5)
        
        LazyVStack{
            ScrollView(.horizontal,  showsIndicators: false) {
                LazyHStack{
                    
                    ForEach(self.topRated, id: \.title){dis in
//                        PopularMovieCell(
                        MovieListCell(result: dis)
                    }
                } .padding()
            }
        }
    }
}

//struct TopRatedMovieListVM_Previews: PreviewProvider {
//    static var previews: some View {
//        TopRatedMovieListVM()
//    }
//}

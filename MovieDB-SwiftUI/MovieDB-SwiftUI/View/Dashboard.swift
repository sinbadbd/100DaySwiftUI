//
//  Dashboard.swift
//  MovieDB-SwiftUI
//
//  Created by Imran on 20/9/20.
//  Copyright © 2020 portonics. All rights reserved.
//

import SwiftUI

struct Dashboard: View {
    
    @State var result :[Discover] = []
    @State var movies : [Movie] = []
    @State var resultMovie :[Result] = []
    @State var disc : Discover!
//    @State var imgUrl = URL(string: "\(APIClient.EndPoints.POSTER_URL + discover.posterPath)")

    var body: some View {
        VStack{
            HStack{
                Text("Movies")
                    .font(.title)
                    .fontWeight(.semibold)
                Spacer(minLength: 0)
                
                Button(action: {}){
                    Image(systemName: "magnifyingglass")
                        .renderingMode(.original)
                        .foregroundColor(.black)
                        .frame(width: 40, height: 40)
                }
                
                
            }
            .padding([.horizontal,.bottom])
            .padding(.top,5)
            
            
            ScrollView(.horizontal,  showsIndicators: false) {
                VStack{
                    HStack{
                        ForEach(resultMovie, id:\.self){dis in
                            ZStack{
                                
                                Image("hero")
                                    .resizable()
                                    .frame(width: 340, height: 180)
                                
                                Text(resultMovie[0].title)
                                    .font(.title)
                                    .foregroundColor(.white)
                                    .frame(alignment: .bottom)
                                    .offset(x: -60, y: 50)
                                
                                
                                
                                
                            }.cornerRadius(10)
                        }
                    }
                }.padding()
            }
            .onAppear{
                APIClient.getDiscoverMovieList { (response, error) in
//                    self.discover = response.
//                    self.movies = response ?? []
//                    self.resultMovie = response!
//                    self.movies.append(self)
//                    print(self.movies)
//
                    if let response =  response {
//                        self.result = response.
                        self.resultMovie = response
//                        print("response\(self.result)")
                    }
                }
            }
            
            // up comming
            HStack {
                Text("Up Comming Movie").font(.title)
                Spacer(minLength: 0)
                Button(action: {}) {
                    Image(systemName: "chevron.right.2")
                        .renderingMode(.original)
                        .frame(width: 30, height: 30)
                }
            }.padding(.vertical,10)
            .padding(.horizontal,20)
            .border(Color.gray, width: 0.5)
            
            ScrollView(.horizontal,  showsIndicators: false) {
                VStack{
                    HStack{
                        ForEach(1...5, id:\.self){_ in
                             VStack{
                                
                                Image("hero")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 150, height: 240)
                                    .cornerRadius(10)
                                
                                Text("The Movie Db")
                                    .font(.title3)
                                    .foregroundColor(.black)
                                
                             }
                        }
                    }
                }.padding()
                
            }
            
            
            // Now Playing Movie
            
            // Popular  Movie
            
            // Top rated  Movie
            
            // Now Playing Movie
            
            Spacer(minLength: 0)
            
            
        }
        //        .background(Color.black.opacity(0.05).ignoresSafeArea(.all, edges: .all))
        //                .ignoresSafeArea(.all, edges: .bottom)
    }
}

struct Dashboard_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            Dashboard()
                .previewDevice("iPhone 11 Pro Max")
            //            Dashboard()
            //                .previewDevice("iPhone SE (2nd generation)")
            //            Dashboard()
            //                .previewDevice("iPod touch (7th generation)")
            //            Dashboard()
            //                .previewDevice("iPad Pro (12.9-inch) (4th generation)")
        }
    }
}

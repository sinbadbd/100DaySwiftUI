//
//  MovieDetailsView.swift
//  MovieDB-SwiftUI-Combine
//
//  Created by Imran on 1/2/21.
//

import SwiftUI

struct MovieDetailsView: View {
    
    @StateObject private var loader : ImageLoader
    @ObservedObject private var movieManager = MovieDownloadManager()
    
    var movie: Movie
    
    init(movie: Movie) {
        self.movie =  movie
        _loader = StateObject(wrappedValue: ImageLoader(url: URL(string: movie.posterPath)!, cache: Environment(\.imageCache).wrappedValue))
    }
    
    var body: some View {
        ZStack(alignment: .top){
            backgroundView
            ScrollView(.vertical, showsIndicators: false){
                VStack{
                    headerView
                    moviePoster
                    movieOverViewTitle
                    reviewLink
                    castInfo
                    movieImagesList
                    similarMovieList
                    remondedMovieList
                }.padding()
            }
        }
        //.edgesIgnoringSafeArea(.top)
    }
    
    private var movieOverViewTitle: some View {
        Text(movie.overview ?? "--")
            .font(.body)
            .foregroundColor(.white)
            .fixedSize(horizontal: false, vertical: true)
            .padding()
    }
    
    private var moviePoster: some View {
        HStack(alignment: .center){
            Spacer()
            imageView
                .aspectRatio(contentMode: .fit)
                .frame(width: 200, height: 320)
                .cornerRadius(20)
            Spacer()
        }
    }
    
    private var headerView: some View {
        VStack{
            Text(movie.titleWithLanguage)
                .font(.title)
                .foregroundColor(.white)
            
            Text("Release Date: \(movie.release_date ?? "")")
                .font(.subheadline)
                .foregroundColor(.white)
        }
        //.foregroundColor(.white)
    }
    
    private var backgroundView: some View {
        imageView.onAppear{
            loader.load()
        }.blur(radius: 100)
    }
    
    private var imageView : some View {
        Group {
            if loader.image != nil {
                Image(uiImage: loader.image!)
                    .resizable()
            }else {
                Rectangle()
                    .foregroundColor(Color.gray.opacity(0.5))
            }
        }
    }
    
    private var reviewLink : some View {
        VStack{
            Divider()
            NavigationLink( destination: MovieReviewView(movie: movie)){
                HStack{
                    Text("Review")
                        .font(.body)
                        .fontWeight(.medium)
                        .foregroundColor(.white)
                    Spacer()
                }
            }
            Divider()
        }
    }
    private var castInfo : some View {
        VStack(alignment: .leading){
            Text("Cast")
                .foregroundColor(.white)
            ScrollView(.horizontal, showsIndicators: false){
                HStack(alignment: .top, spacing: 20){
                    ForEach(movieManager.cast) { cast in
                        NavigationLink(
                            destination: MovieArtistProfile(cast: cast) ){//MovieArtistProfile()
                            
                            VStack{
                                AsyncImage(url: URL(string: cast.profilePhoto )!) {
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
                                
                                Text(cast.character ?? "--")
                                    .font(.caption)
                                    .foregroundColor(.white)
                                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                                    .fixedSize(horizontal: false, vertical: true)
                            }
                        }
                        
                    }
                }
            }
        }.onAppear{
            movieManager.getCast(for: movie)
        }
    }
    
    private var similarMovieList : some View {
        VStack(alignment: .leading){
            Text("Similar Movie")
            
            ScrollView(.horizontal, showsIndicators: false){
                HStack{
                    ForEach(movieManager.movies){ movie in
                        
                        NavigationLink(destination: MovieDetailsView(movie: movie)){
 
                            VStack{
                                AsyncImage(url: URL(string: movie.posterPath )!) {
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
 
                             MovieImageCell(movie: movie)
 
                        }
                    }.frame(width: 120, height: 180, alignment: .leading)
                }
            }
            
        }.onAppear{
            movieManager.getSimilarMovie(for: movie)
        }
    }
    
    private var remondedMovieList : some View {
        VStack(alignment: .leading){
            Text("Recomanded Movie")
            
            ScrollView(.horizontal, showsIndicators: false){
                HStack{
                    ForEach(movieManager.movies){ movie in
                        NavigationLink(destination: MovieDetailsView(movie: movie)){
                            MovieImageCell(movie: movie) 
                            
                        }
                    }.frame(width: 120, height: 180, alignment: .leading)
                }
            }
            
        }.padding(.top, 20)
        .onAppear{
            movieManager.getRecommandedMovie(for: movie)
            
        } 
    } 
 
   
    
    private var movieImagesList : some View {
        VStack(alignment: .leading){
            Text("Images")
            ScrollView(.horizontal, showsIndicators: false){
                HStack{
                    ForEach(movieManager.images){ images in
                        
                        VStack{
                            
                            AsyncImage(url: URL(string: images.movieImage)!) {
                               
                                Rectangle()
                                    .foregroundColor(Color.gray.opacity(0.5))
                                
                            } image: { (img) -> Image in
                                Image(uiImage: img)
                                    .resizable()
                            }
                            .animation(.easeOut(duration: 0.5))
                            .transition(.opacity)
                            .scaledToFit()
                            .cornerRadius(15)
                            .shadow(radius: 15)
                            
 
//                            Text(images.movieImage )
 
                        }
                       
                        
                        
                    }.frame(width: 120, height: 180, alignment: .leading)
                }
                
            }
        }.onAppear{
            movieManager.getMovieImageList(for: movie)
        }
        
    }
 

 
}

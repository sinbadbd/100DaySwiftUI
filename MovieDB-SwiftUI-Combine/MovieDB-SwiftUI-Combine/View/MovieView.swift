//
//  MovieView.swift
//  MovieDB-SwiftUI-Combine
//
//  Created by Imran on 1/2/21.
//

import SwiftUI

struct MovieView: View {
    
    @State private var searchTerm = ""
    @State private var selectionIndex = 0
    @State private var tabs = ["Now Playing", "Upcomming", "Trending", "Top Rated"]
    
    @ObservedObject var movieManager = MovieDownloadManager()
    
//    init() {
//        UITableView.appearance().backgroundColor = UIColor.clear
//        UITableViewCell.appearance().selectionStyle = .none
//
//        UINavigationBar.appearance().backgroundColor = .clear
//        UINavigationBar.appearance().tintColor = .white
//        UINavigationBar.appearance().barTintColor = .orange
//        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.orange]
//        UINavigationBar.appearance().largeTitleTextAttributes  = [.foregroundColor: UIColor.orange]
//        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
//    }
    
    var body: some View {
        VStack{
            VStack(alignment: .leading) {
//                Text(tabs[selectionIndex])
//                    .font(.largeTitle)
//                    .bold()
//                    .foregroundColor(.red)
//                    .padding(.top)
                
                HStack{
                    Image(systemName: "magnifyingglass")
                        .imageScale(.medium)
                    
                    TextField("Search...", text: $searchTerm)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                }
            }.padding(.horizontal)
            
            VStack{
                Picker("_", selection: $selectionIndex){
                    ForEach(0..<tabs.count){ index in
                        Text(tabs[index])
                            .font(.title)
                            .bold()
                            .tag(index)
                    }
                }.pickerStyle(SegmentedPickerStyle())
                    .onChange(of: selectionIndex, perform: { (_) in
                        if selectionIndex == 0 {
                            movieManager.getNowPlaying()
                        } else if selectionIndex == 1 {
                            movieManager.getUpcomming()
                        }else if selectionIndex == 2 {
                            movieManager.getPopular()
                        }else if selectionIndex == 3 {
                            movieManager.getTopRated()
                        }
                    })
            }.padding()
            
            List{
                ForEach(movieManager.movies.filter {
                    searchTerm.isEmpty ? true :
                    $0.title?.lowercased().localizedStandardContains(searchTerm.lowercased()) ?? true }) { movie in
                        NavigationLink( destination: MovieDetailsView(movie: movie)) {
                            MovieCell(movie: movie)
                        }.listRowBackground(Color.clear)
                    }
            }.onAppear{
                movieManager.getNowPlaying()
            }
            Spacer()
        }
    }
}

struct MovieView_Previews: PreviewProvider {
    static var previews: some View {
        MovieView()
    }
}

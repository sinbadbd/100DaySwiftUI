//
//  HomeTabView.swift
//  MovieDB-SwiftUI-Combine
//
//  Created by Imran on 1/2/21.
//

import SwiftUI

struct HomeTabView: View {
    enum Tab: Int {
        case movie
        case discover
    }
    @State private var selectedTab = Tab.movie
    var body: some View {
        TabView(selection: $selectedTab) {
            MovieView()
                .tabItem {
                    tabBarItem(text: "Movies", image: "film")
                }.tag(Tab.movie)
            DiscoverView()
                .tabItem {
                    tabBarItem(text: "Discover", image: "square.stack")
                }.tag(Tab.discover)
        }
    }
    
    private func tabBarItem(text:String, image: String)->some View{
        VStack{
            Text(text)
            Image(systemName: image)
                .imageScale(.large)
        }
    }
}

struct HomeTabView_Previews: PreviewProvider {
    static var previews: some View {
        HomeTabView()
    }
}

//
//  ContentView.swift
//  InstagramClone
//
//  Created by Imran Mia on 18/11/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            TabView {
                HomeView()
                    .tabItem {
                        Image(systemName: "house")
                    }
                SearchView()
                    .tabItem {
                        Image(systemName: "magnifyingglass")
                    }
                MediaView()
                    .tabItem {
                        Image(systemName: "plus.app")
                    }
                ShopView()
                    .tabItem {
                        Image(systemName: "bag")
                    }
                ProfileView()
                    .tabItem {
                        Image(systemName: "person.circle")
                    }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

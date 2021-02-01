//
//  ContentView.swift
//  MovieDB-SwiftUI-Combine
//
//  Created by Imran on 1/2/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showSettings = false
    
    var body: some View {
        NavigationView{
            Group{
                HomeTabView()
            }.navigationBarTitle("Movies", displayMode: .automatic)
            .navigationBarItems(trailing: HStack{
                SettingButton
            })
            .sheet(isPresented: $showSettings, content: {
                SettingsView(isPresented: $showSettings)
            })
        }
    }
    
    
    private var SettingButton: some View{
        Button(action:{
            showSettings.toggle()
        }) {
            HStack{
                Image(systemName: "gear")
                    .imageScale(.large)
                    .foregroundColor(.gray)
            }.frame(width: 40, height: 40)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

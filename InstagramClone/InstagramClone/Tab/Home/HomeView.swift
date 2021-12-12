//
//  HomeView.swift
//  InstagramClone
//
//  Created by Imran Mia on 4/12/21.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack {
            ScrollView {
                MyDayView()
                    //.background(Color.red)
                PostMainView()
                    //.background(Color.yellow)
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

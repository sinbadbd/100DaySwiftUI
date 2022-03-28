//
//  HomeView.swift
//  Crypto
//
//  Created by Imran on 22/3/22.
//

import SwiftUI

struct HomeView: View {
    
    @State private var showPortfolio: Bool = false
    
    var body: some View {
        
        ZStack{
            Color.theme.background
                .ignoresSafeArea()
            //
            VStack{
                homeHeader
                Spacer(minLength: 0)
            }
        }
    }
}

extension HomeView {
    private var homeHeader :some View {
        HStack{
            
            CircleButton(iconName: showPortfolio ? "plus" : "info")
                .animation(.none, value: 0)
                .background(
                    CircleButtonAnimationView(animate: $showPortfolio)
                )
            Spacer()
            Text(showPortfolio ? "Portfolio" : "Header")
                .font(.headline)
                .fontWeight(.heavy)
                .foregroundColor(Color.theme.accent)
                .animation(.none, value: 0)
            Spacer(minLength: 0)
            Spacer()
            CircleButton(iconName: "chevron.right")
                .rotationEffect(Angle(degrees: showPortfolio ? 180: 0))
                .onTapGesture {
                    withAnimation(.spring()) {
                        showPortfolio.toggle()
                    }
                }
        }
        .padding(.horizontal)
    }
}



struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

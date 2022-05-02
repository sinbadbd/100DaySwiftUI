//
//  HomeView.swift
//  Crypto
//
//  Created by Imran on 22/3/22.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject private var vm: HomeVieModel
     
    @State private var showPortfolio: Bool = false // animation right
    @State private var showPortfolioView: Bool = false // new sheet
    
    var body: some View {
        
        ZStack{
            Color.theme.background
                .ignoresSafeArea()
                .sheet(isPresented: $showPortfolioView) {
                    PortfolioView()
                        .environmentObject(vm)
                }
            //
            VStack{
                homeHeader
                HomeStatView(showProtfolio: $showPortfolio)
                //if !showPortfolio{
                SearchBarView(searchText: $vm.searchText)
                //}
                ColumnTitle
                if !showPortfolio {
                    allCoinList
                        .transition(.move(edge: .leading))
                }
                if showPortfolio {
                    protfolioCoinList
                        .transition(.move(edge: .trailing))
                }
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
                .onTapGesture {
                    if showPortfolio {
                        showPortfolioView.toggle()
                    }
                }
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
    
    private var allCoinList: some View {
         List{
            ForEach(vm.allCoins){ coin in
                CoinRowView(coin: coin, showHoldingColumn: false)
                    .listRowInsets(.init(top: 10, leading: 0, bottom: 10, trailing: 10))
            }
        }
        .listStyle(.plain)
    }
    
    private var protfolioCoinList: some View {
        List{
            ForEach(vm.protfolioCoins){ coin in
                CoinRowView(coin: coin, showHoldingColumn: true)
                    .listRowInsets(.init(top: 10, leading: 0, bottom: 10, trailing: 10))
            }
        }
        .listStyle(.plain)
    }
    
    private var ColumnTitle: some View {
        HStack {
            Text("Coin")
            Spacer()
            if showPortfolio {
                Text("Holdings")
            }
            Text("Price")
                .frame(width: UIScreen.main.bounds.width / 3.5, alignment: .trailing)
            Button {
                withAnimation(.linear(duration: 2.0)){
                    vm.reloadApiCall()
                }
            } label: {
                Image(systemName: "goforward")
            }
            .rotationEffect(Angle(degrees: vm.isLoading ? 360 : 0), anchor: .center)
//            .rotationEffect(Angle(degrees: vm.isLoading ? 360: 0), anchor: .center)

         }
        .font(.caption)
        
        .foregroundColor(Color.theme.secondaryText)
        .padding(.horizontal)
    }
}



struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            HomeView()
                .navigationBarHidden(true)
        }
        .environmentObject(dev.homeVM)
    }
}

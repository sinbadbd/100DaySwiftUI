//
//  ContentView.swift
//  7-CoinTracker
//
//  Created by Imran on 22/9/20.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject private var data = CoinListViewModel()
    
    init() {
        UITableView.appearance().separatorStyle = .none
        UITableView.appearance().backgroundColor = .clear
        UITableViewCell.appearance().backgroundColor = .clear
        UITableViewCell.appearance().selectionStyle = .none
        data.getCoins()
    }
    
    var body: some View {
        ZStack{
          //  GrapView(data: [0.4,0.3,0.9,0.21,0.6,0.0,0.1])
            Color.base
            List {
                VStack(alignment: .center){
                    Text("Coin Tracker")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .padding(.top, 50)
                        .neumorphicsShadow()
                    
                    ForEach(data.coins){ coin in
                         CoinCell(coin: coin)
                            .neumorphicsShadow()
                    }
                }
            }
        }.edgesIgnoringSafeArea(.all)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

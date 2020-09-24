//
//  CoinCell.swift
//  7-CoinTracker
//
//  Created by Imran on 24/9/20.
//

import SwiftUI

struct CoinCell: View {
    
    let coin: CoinViewModel
    private let positiveChangeColor = Color.greenish
    private let negativeChangeColor = Color.red
    
    @State private var showGraph = false
    
    var body: some View {
        VStack(spacing: 0){
            HStack{
                Image(coin.symbol)
                    .resizable()
                    .frame(width: 60, height: 60)
                    .padding(2)
                    .background(coin.color)
                    .cornerRadius(30)
                
                VStack(alignment: .leading){
                    Text(coin.name)
                        .foregroundColor(Color.greenish)
                    
                    Text(String(format: "%@%0.02f", coin.change > 0.0 ? "+" : "", coin.change))
                        .foregroundColor(coin.change > 0.0 ? positiveChangeColor: negativeChangeColor)
                }
                Spacer()
                VStack{
                    Text(coin.formattedPrice)
                        .foregroundColor(Color.greenish)
                }
                
            }.neumorphicsShadow()
                .padding()
                .background(
                    Text(coin.symbol.uppercased())
                        .rotationEffect(.degrees(-45))
                        .foregroundColor(Color.drakShadow)
                        .opacity(0.1)
                        .neumorphicsShadow()
                        .offset(x:100)
                ).background(Color.base)
            .cornerRadius(20)
            .padding()
            .onTapGesture {
                self.showGraph.toggle()
            }
            
            if self.showGraph {
                GrapView(data: coin.history)
                    .frame(height:200)
                    .offset( y: -25)
            }
        }
    }
}
//
//struct CoinCell_Previews: PreviewProvider {
//    static var previews: some View {
//        CoinCell()
//    }
//}

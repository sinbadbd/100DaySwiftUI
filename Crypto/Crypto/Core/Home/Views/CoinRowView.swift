//
//  CoinRowView.swift
//  Crypto
//
//  Created by Imran on 28/3/22.
//

import SwiftUI

struct CoinRowView: View {
    let coin: CoinModel
    let showHoldingColumn: Bool
    
    var body: some View {
        HStack(spacing:0){
            leftColumn
            Spacer()
            centerColumn
            rightColumn
        }
    }
}

struct CoinRowView_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            CoinRowView(coin: dev.coin, showHoldingColumn: true)
                .previewLayout(.sizeThatFits)
            
            CoinRowView(coin: dev.coin, showHoldingColumn: true)
                .previewLayout(.sizeThatFits)
                .preferredColorScheme(.dark)
        }
    }
}

extension CoinRowView {
    
    private var leftColumn: some View {
        HStack(spacing:0){
            Text("\(coin.marketCapRank ?? 0)")
                .font(.headline)
                .foregroundColor(Color.theme.secondaryText)
                .frame(minWidth: 30)
            Circle()
                .frame(width: 30, height: 30)
            Text(coin.symbol?.uppercased() ?? "")
                .font(.headline)
                .padding(.leading,6)
                .foregroundColor(Color.theme.accent)
        }
    }
    
    private var centerColumn : some View {
        VStack{
            if showHoldingColumn{
                VStack(alignment: .trailing) {
                    Text("\(coin.currentHoldingValue.asCurrencyWith2Decimals())")
                        .bold()
                    Text(coin.currentHoldings?.asNumberString() ?? "")
                }.foregroundColor(Color.theme.accent)
            }
        }
    }
    
    private var rightColumn: some View {
        VStack(alignment: .trailing) {
            Text("\(coin.currentPrice?.asCurrencyWith2Decimals() ?? "")")
                .bold()
                .foregroundColor(Color.theme.accent)
            Text(coin.priceChangePercentage24h?.asPercentString() ?? "")
                .foregroundColor(
                    coin.priceChangePercentage24h ?? 0 >= 0 ?
                    Color.theme.green :
                        Color.theme.red
                )
        }
        .frame(width: UIScreen.main.bounds.width / 3.5, alignment: .trailing)
    }
    
}

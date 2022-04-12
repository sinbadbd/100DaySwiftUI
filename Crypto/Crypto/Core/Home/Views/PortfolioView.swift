//
//  PortfolioView.swift
//  Crypto
//
//  Created by Imran on 9/4/22.
//

import SwiftUI

struct PortfolioView: View {
    
    
    @EnvironmentObject private var vm: HomeVieModel
    @State private var selecteCoin: CoinModel? = nil
    @State private var quantityText: String = ""
    @State private var showCheckmark: Bool = false
    
    var body: some View {
        NavigationView{
            ScrollView{
                VStack(alignment: .leading, spacing: 10) {
                    SearchBarView(searchText: $vm.searchText)
                    coinLogoList
                    if selecteCoin != nil {
                        portfolioInputSection
                    }
                }
            }
            .navigationTitle("Edit Profile")
            .toolbar(content: {
                ToolbarItem(placement: .navigationBarLeading){
                    XButtonView()
                }
                ToolbarItem(placement: .navigationBarTrailing){
                    tralingNavBar
                }
            })
            .onChange(of: vm.searchText) { newValue in
                if newValue == "" {
                    removeSelectedCoin()
                }
            }
        }
    }
}

struct PortfolioView_Previews: PreviewProvider {
    static var previews: some View {
        PortfolioView()
            .environmentObject(dev.homeVM)
    }
}

extension PortfolioView {
    private var coinLogoList: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack( spacing: 10) {
                ForEach(vm.allCoins){ coin in
                    CoinLogoView(coin: coin)
                        .frame(width: 75)
                        .padding(4)
                        .onTapGesture {
                            withAnimation(.easeIn){
                                selecteCoin = coin
                            }
                        }
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(selecteCoin?.id == coin.id ? Color.theme.green: Color.clear, lineWidth: 1)
                        )
                }
            }
            .padding(.vertical, 4)
            .padding(.leading)
        }
    }
    private var portfolioInputSection: some View {
        VStack(spacing: 20){
            HStack{
                Text("Current price of :\(selecteCoin?.symbol.uppercased() ?? ""): ")
                Spacer()
                Text(selecteCoin?.currentPrice.asCurrencyWith2Decimals() ?? "")
            }
            Divider()
            HStack{
                Text("Amount Holding:")
                Spacer()
                TextField("Ex: 1.4", text: $quantityText)
                    .multilineTextAlignment(.trailing)
                    .keyboardType(.decimalPad)
            }
            Divider()
            HStack{
                Text("Curretnt value:")
                Spacer()
                Text(getCurrentDouble().asCurrencyWith2Decimals())
            }
        }
        .animation(.none)
        .padding()
    }
    
    private var tralingNavBar: some View {
        HStack(spacing: 10){
            Image(systemName: "checkmark")
                .opacity(showCheckmark ? 1.0 : 0.0)
            
             Button {
                 saveButtonPressed()
            } label: {
                Text("Save".uppercased())
                    .font(.headline)
                    .opacity((selecteCoin != nil && selecteCoin?.currentPrice != Double(quantityText)) ? 1.0 : 0.0)
            }
        }
    }
    
    private func getCurrentDouble() -> Double {
        if let qty = Double(quantityText)  {
            return qty * (selecteCoin?.currentPrice ?? 0)
            
        }
        return 0
    }
    
    
    private func saveButtonPressed(){
        guard let coin = selecteCoin else { return }
        
        //show checkmark
        withAnimation(.easeIn) {
            showCheckmark = true
            removeSelectedCoin()
        }
        
        //hide keyboard
        UIApplication.shared.endEditing()
        
        // hide checkmark
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            withAnimation(.easeOut) {
                showCheckmark =  false
            }
        }
        
        
    }
    
    private func removeSelectedCoin(){
        selecteCoin = nil
        vm.searchText = ""
    }
}

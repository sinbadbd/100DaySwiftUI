//
//  PortfolioView.swift
//  Crypto
//
//  Created by Imran on 9/4/22.
//

import SwiftUI

struct PortfolioView: View {
    
    
    var body: some View {
        NavigationView{
            ScrollView{
                VStack(alignment: .leading, spacing: 10) {
                    Text("hi")
                }
            }
            .navigationTitle("Edit Profile")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading){
                    XButtonView()
                }
            }
        }
    }
}

struct PortfolioView_Previews: PreviewProvider {
    static var previews: some View {
        PortfolioView()
    }
}

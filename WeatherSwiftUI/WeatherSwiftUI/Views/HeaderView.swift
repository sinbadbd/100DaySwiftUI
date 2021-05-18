//
//  HeaderView.swift
//  WeatherSwiftUI
//
//  Created by Imran on 17/5/21.
//

import SwiftUI

struct HeaderView: View {
    
    @ObservedObject var cityVM: CityViewViewModel
    
    @State private var searchTerm = "Rangpur"
    
    var body: some View {
        HStack {
            TextField("", text: $searchTerm)
                .padding(.leading, 20)
            Button {
                cityVM.city = searchTerm
            } label : {
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.blue)
                    Image(systemName: "location.fill")
                }
            }.frame(width: 50, height: 50)
        }
        .foregroundColor(.white)
        .padding()
        .background(ZStack {
            Image(systemName: "magnigyingglass")
                .padding(.leading, 10)
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.blue.opacity(0.5))
        })
    }
}

//struct HeaderView_Previews: PreviewProvider {
//    static var previews: some View {
//        HeaderView(cityVM: CityViewViewModel)
//    }
//}

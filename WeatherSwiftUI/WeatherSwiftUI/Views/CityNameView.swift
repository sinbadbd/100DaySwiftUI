//
//  CityNameView.swift
//  WeatherSwiftUI
//
//  Created by Imran on 18/5/21.
//

import SwiftUI

struct CityNameView: View {
    
      var city: String
      var date: String
    
    var body: some View {
        HStack{
            Text(city).font(.title)
            Text(date).font(.caption2)
        }
    }
}

struct CityNameView_Previews: PreviewProvider {
    static var previews: some View {
        CityNameView(city: "test", date: "3.35.5")
    }
}

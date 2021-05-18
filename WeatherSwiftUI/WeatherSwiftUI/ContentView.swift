//
//  ContentView.swift
//  WeatherSwiftUI
//
//  Created by Imran on 17/5/21.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var cityVM = CityViewViewModel()
 
    init() {
        cityVM.getLocation()
        print(cityVM.conditions)
    }
    
    var body: some View {
        HeaderView(cityVM: cityVM)
        TodayWeatherView(cityVM: cityVM)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

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
        ScrollView(.vertical, showsIndicators: false) {
            VStack{
                HeaderView(cityVM: cityVM)
                CityNameView(city: cityVM.city, date: cityVM.date)
                TodayWeatherView(cityVM: cityVM)
                HourlyWeatherView(cityVM: cityVM)
                DailyWeatherView(cityVM: cityVM)
                Spacer()
            }.padding()
        }.background(
            RoundedRectangle(cornerRadius: 10)
                .fill(
                    LinearGradient(
                        gradient: Gradient(colors: [Color.blue]),
                        startPoint: .top,
                        endPoint: .bottom
                    )
                ).opacity(0.5)
                .ignoresSafeArea()
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

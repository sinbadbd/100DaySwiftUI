//
//  DailyWeatherViewswift.swift
//  WeatherSwiftUI
//
//  Created by Imran on 18/5/21.
//

import SwiftUI

struct DailyWeatherView : View {
    
    @ObservedObject var cityVM : CityViewViewModel
    
    var body: some View {
        VStack {
            ForEach(cityVM.weather?.daily ?? []) { weather in
                LazyVStack {
                    dailyCell(weather: weather)
                }
            }
        }
    }
    
    
    func dailyCell(weather: WeatherDaily) -> some  View {
        HStack {
            Text(cityVM.getDayFor(timesTamp: weather.dt ?? 0).uppercased())
                .frame(width: 50)
//            Spacer()
            Text("\(cityVM.getTempFor(temp: Double(weather.temp?.min ?? 0   ))) ℃ | \(cityVM.getTempFor(temp: Double(Int(weather.temp?.max ?? 0)))) ℃ | \(cityVM.getTimeFor(timestemp: weather.dt ?? 0))")
                .frame(width: 200)
            Spacer()
//            Image(cityVM.getWeatherIcon(icon: weather.weather?[0].icon ?? ""))
            LottieAnimationView(name: cityVM.getWeatherAnimationIcon(icon: weather.weather?[0].icon ?? ""))
        }
        .padding()
        .foregroundColor(.white)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(
                    LinearGradient(
                        gradient: Gradient(colors: [Color.blue.opacity(0.5),Color.blue]),
                        startPoint: .top,
                        endPoint: .bottom
                    )
                ).opacity(0.3)
        )
        .shadow(
            color: Color.white.opacity(0.5),
            radius: 2, x: -2, y: -2
        )
        .shadow(
            color: Color.white.opacity(0.5),
            radius: 2, x: 2, y: 2
        )

    }
}

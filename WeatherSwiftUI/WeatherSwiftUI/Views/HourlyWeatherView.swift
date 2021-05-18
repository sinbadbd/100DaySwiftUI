//
//  HourlyWeatherView.swift
//  WeatherSwiftUI
//
//  Created by Imran on 18/5/21.
//

import SwiftUI

struct HourlyWeatherView: View {
    
    @ObservedObject var cityVM : CityViewViewModel
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing:20){
                ForEach(cityVM.weather?.hourly ?? []) { hourly in
//                    Text("\(hourly.feelsLike)")
//                    let icon = cityVM.getWeatherIcon(
//                        icon: hourly.weather?.count ?? 0 > 0
//                            ?
//                            "\(hourly.weather?[0].icon ?? "")"
//                            : "sun.max.fill" )
                    let icon =  LottieAnimationView(name: cityVM.getWeatherAnimationIcon(icon: hourly.weather?[0].icon ?? ""))
                    let hour = cityVM.getTimeFor(timestemp: hourly.dt ?? 0)
                    let temp = "\(cityVM.temperature) ℃" 
                    getHourlyView(image: "\(icon)", hourly: hour, temp: temp)
                }
            }
        }
    }
    
    
    func getHourlyView(image: String, hourly: String, temp: String) -> some View {
        
        VStack{
//            Image(image).foregroundColor(Color.red).frame(width: 20, height: 20)
            Image(image)
            Text(hourly)
            Text(temp)
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

//struct HourlyWeatherView_Previews: PreviewProvider {
//    static var previews: some View {
////        HourlyWeatherView()
//    }
//}

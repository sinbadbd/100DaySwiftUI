//
//  TodayWeatherView.swift
//  WeatherSwiftUI
//
//  Created by Imran on 18/5/21.
//

import SwiftUI

struct TodayWeatherView: View {
    
    @ObservedObject var cityVM: CityViewViewModel
    
    var body: some View {
        VStack{
            Text("Today")
                .font(.largeTitle)
                .bold()
            
            HStack{
                LottieAnimationView(name: cityVM.getWeatherAnimationIcon(icon: cityVM.weatherIcon))
                    .frame(width: 100, height: 100)
                
                HStack{
                    Text("Temp: \(cityVM.temperature)")
                    Text("Con: \(cityVM.conditions)")
                }
            }
           
            
            HStack{
                Spacer()
                widgetView(image: "wind", color: .green, title: "\(cityVM.windSpeed)")
                Spacer()
                widgetView(image: "drop.fill", color: .green, title: "\(cityVM.humidity)")
                Spacer()
                widgetView(image: "umbrella.fill", color: .green, title: "\(cityVM.rainChances)")
                Spacer()
             }
            
        }
    }
    
    private func widgetView(image:String, color:Color, title:String) -> some View {
        VStack{
            Image(systemName: image)
                .font(.title)
                .padding()
                .foregroundColor(color)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.white)
                )
            Text(title)
        }
    }
    
    
}

//struct TodayWeatherView_Previews: PreviewProvider {
//    static var previews: some View {
//        TodayWeatherView()
//    }
//}

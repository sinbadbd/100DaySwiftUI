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
            
            ZStack{
                Text(cityVM.weather?.current?.weather?[0].descriptionField ?? "")
            }
            
            HStack{
                LottieAnimationView(name: cityVM.getWeatherAnimationIcon(icon: cityVM.weatherIcon))
                    .frame(width: 100, height: 100)
                
                VStack{
                    Text("\(cityVM.temperature) ℃")
                    Text("\(cityVM.conditions)")
                }
            }
            
            HStack{
                Spacer()
                widgetView(image: "wind", color: .green, title: "\(cityVM.windSpeed)")
                Spacer()
                widgetView(image: "drop.fill", color: .blue, title: "\(cityVM.humidity)")
                Spacer()
                widgetView(image: "umbrella.fill", color: .red, title: "\(cityVM.rainChances)")
                Spacer()
            }
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

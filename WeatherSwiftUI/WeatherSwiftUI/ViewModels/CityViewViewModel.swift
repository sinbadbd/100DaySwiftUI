//
//  CityViewModel.swift
//  WeatherSwiftUI
//
//  Created by Imran on 17/5/21.
//

import CoreLocation
import SwiftUI

final class CityViewViewModel: ObservableObject {
    
//    @Published var weather = WeatherResponse()
    @Published var weather: WeatherResponse?
    
    
    @Published var city: String = "Rangpur" {
        didSet {
            // call get location here
        }
    }
    
    init() {
        // getLocation()
    }
    
    
    private lazy var dateFormatter: DateFormatter = {
        let formatter  = DateFormatter()
        formatter.dateStyle = .full
        return formatter
    }()
    
    private lazy var dayFormatter: DateFormatter = {
        let formatter  = DateFormatter()
        formatter.dateFormat = "EEE"
        return formatter
    }()
    
    private lazy var timeFormatter: DateFormatter = {
        let formatter  = DateFormatter()
        formatter.dateFormat = "hh a"
        return formatter
    }()
   
    
    var date: String {
        return dateFormatter.string(from: Date(timeIntervalSince1970: weather?.current?.dt ?? 0))
    }
    
    var weatherIcon: String {
        if weather?.current?.weather?.count  ?? 0 > 0 {
            return weather?.current?.weather?[0].icon ?? ""
        }
        return "sun.max.fill"
    }
    
    var conditions : String {
        if weather?.current?.weather?.count  ?? 0 > 0 {
            return weather?.current?.weather?[0].main ?? ""
        }
        return " "
    }
    
    var windSpeed: String {
        return String(format: "%0.1f", weather?.current?.windSpeed ?? 0)
    }
    
    var humidity: String {
        return String(format: "%d%%", weather?.current?.humidity ?? 0)
    }
    
    var rainChances: String {
        return String(format: "%0.0f%%", weather?.current?.dewPoint ?? 0)
    }
    
    
    
    var temperature: String {
        return getTempFor(temp: Double(weather?.current?.temp ?? 0))
    }
    
    func getTimeFor(timestemp: Int) -> String {
        return timeFormatter.string(from: Date(timeIntervalSince1970: TimeInterval(timestemp)))
    }
    
    func getTempFor(temp: Double) -> String {
        return String(format: "%0.1f", temp)
    }
    
    func getDayFor(timesTamp: Int) -> String {
        return dayFormatter.string(from: Date(timeIntervalSince1970: TimeInterval(timesTamp)))
    }
    
    
    private func getWeather(){
        
    }
    
    private func getWeatherInternal(city: String, for urlString: String){
        
    }
}

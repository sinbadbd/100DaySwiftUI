//
//  CityViewModel.swift
//  WeatherSwiftUI
//
//  Created by Imran on 17/5/21.
//


import SwiftUI
import CoreLocation

final class CityViewViewModel: ObservableObject {
    
   // @Published var weather = WeatherResponse.init(current: WeatherCurrent, daily: [], hourly: [], lat: 0, lon: 0, minutely: [], timezone: "", timezoneOffset: 0)
     @Published var weather: WeatherResponse?
    
    
    @Published var city: String = "Rangpur" {
        didSet {
            // call get location here
           getLocation()
        }
    }
    
   
    init() {
        // getLocation()
          getLocation()
    }
    
    
    func getLocation(){
 
        CLGeocoder().geocodeAddressString(city) { (placeMarks, error) in
            if let places = placeMarks, let place = places.first {
                self.getWeather(croods: place.location?.coordinate)
            }
        }
    }
//
//
    private func getWeather(croods: CLLocationCoordinate2D?){
        if let croods = croods {
            let urlString = API.getURLFor(lat: croods.latitude, lon: croods.longitude)
            getWeatherInternal(city: city, for: urlString)
        }else {
            let urlString = API.getURLFor(lat: Double(weather?.lat ?? 0), lon: Double(weather?.lon ?? 0))
            getWeatherInternal(city: city, for: urlString)
        }
    }

    private func getWeatherInternal(city: String, for urlString: String){
        NetworkManager<WeatherResponse>.fetch(for: URL(string: urlString)!) { result in
            print("result:\(result)")
            switch result {
            case .success(let response):
                print(response)
                DispatchQueue.main.async {
                    self.weather = response
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    
//
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
//

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
        return getTempFor(temp: Double((weather?.current?.temp ?? 0)  ))
        //weatherModel.main.temp - 273.15
    }

    func getTimeFor(timestemp: Int) -> String {
        return timeFormatter.string(from: Date(timeIntervalSince1970: TimeInterval(timestemp)))
    }

    func getTempFor(temp: Double) -> String {
        return String(format: "%0.1f", temp - 273.15 )
    }

    func getDayFor(timesTamp: Int) -> String {
        return dayFormatter.string(from: Date(timeIntervalSince1970: TimeInterval(timesTamp)))
    }
    func toCelsius(temp: Double) -> String {
         return ""
    }
    private func toFahrenheit(){
        
    }
    func getWeatherAnimationIcon(icon: String) -> String {
        switch icon {
        case "01d":
            return "01d-clear-sky"
        case "02d":
            return "02n_few_clouds"
        case "03d":
            return "01d-clear-sky"
        case "04d":
            return "01d-clear-sky"
        case "09d":
            return "01d-clear-sky"
        case "10d":
            return "01d-clear-sky"
        case "11d":
            return "01d-clear-sky"
        case "13d":
            return "01d-clear-sky"
        case "50d":
            return "01d-clear-sky"

        case "01n":
            return "01n_clearsky"
        case "02n":
            return "02n_few_clouds"
        case "03n":
            return "03n_scattered_clouds"
        case "04n":
            return "04n_broken_clouds"
        case "09n":
            return "09n_shower_rain"
        case "10n":
            return "10n_rain"
        case "11n":
            return "11n_thunderstorm"
        case "13n":
            return "13n_snow"
        case "50n":
            return "50n_mist"

        default: break

        }
        return icon
    }
//

    func getWeatherIcon(icon: String) -> String {
        switch icon {
        // DAY ICON
        case "01d":
            return "01d-sun"
        case "02d":
            return "01d-sun"
        case "03d":
            return "01d-sun"
        case "04d":
            return "01d-sun"
        case "09d":
            return "01d-sun"
        case "10d":
            return "01d-sun"
        case "11d":
            return "01d-sun"
        case "12d":
            return "01d-sun"
        case "50d":
            return "01d-sun"

         //NIGHT ICON
        case "01n":
            return "01d-sun"
        case "02n":
            return "01d-sun"
        case "03n":
            return "01d-sun"
        case "04n":
            return "01d-sun"
        case "09n":
            return "01d-sun"
        case "10n":
            return "01d-sun"
        case "11n":
            return "01d-sun"
        case "12n":
            return "01d-sun"
        case "50n":
            return "01d-sun"

        default: break

        }
        return icon
    }
    
   
}

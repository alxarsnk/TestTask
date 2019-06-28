//
//  OpenWeatherService.swift
//  OpenWeatherClient
//
//  Created by Александр Арсенюк on 28/06/2019.
//  Copyright © 2019 Александр Арсенюк. All rights reserved.
//

import Foundation


protocol OpenWeatherServiceProtocol {
   
    func makeRequestForCIty(city: String, complition: @escaping(CityViewModel?)->())
}

class OpenWeatherService: OpenWeatherServiceProtocol {
    
    fileprivate var apiKey = "48a6235c7a21fc8fcad5bb2455a359c6"
    fileprivate var baseURL = "http://api.openweathermap.org/data/2.5/weather?"
    
    //http://api.openweathermap.org/data/2.5/weather?q=Kazan&APPID=48a6235c7a21fc8fcad5bb2455a359c6
    
    func makeRequestForCIty(city: String, complition: @escaping(CityViewModel?)->()) {
        
        var returnModel: CityViewModel?
        let urlString = "\(baseURL)q=\(city)&units=metric&APPID=\(apiKey)"
        guard let url = URL(string: urlString) else {
            complition(nil)
            return}
        let urlRequest = URLRequest(url: url)
        let session = URLSession.shared
        let task = session.dataTask(with: urlRequest) { (data, responce, error) in
            
            if let error = error {
                print(error.localizedDescription)
            } else {
                guard let data = data else {return complition(nil)}
                guard let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] else {return complition(nil)}
                guard let name = json["name"] else {return complition(nil)}
                let main = json["main"] as! [String: Any]
                let temperature = main["temp"]
                let wind = json["wind"] as! [String: Any]
                let windSpeed = wind["speed"]
                let windDeg = wind["deg"]
               
                let cityModel =  CityViewModel(name: name as! String,
                                               temp: Int(truncating: temperature as! NSNumber),
                                               windSpeed: Int(truncating: windSpeed! as! NSNumber),
                                               windDirect: self.convertDegToDirections(degrees: Int(truncating: windDeg! as! NSNumber)))
                returnModel = cityModel
            }
            complition(returnModel!)
        }
        task.resume()
    }
    
    
    /// convert degrees to directions
    ///
    /// - Parameter degrees: degress
    /// - Returns: direction
    private func convertDegToDirections(degrees: Int) -> String {
        
        let value = Double(degrees) / 22.5 + 0.5
        
        let directionsArr = ["N", "NNE", "NE", "ENE", "E", "ESE", "SE", "SSE", "S", "SSW", "SW", "WSW", "W", "WNW", "NW", "NNW"]
        
        let index = Int(value.truncatingRemainder(dividingBy: 16))
        return directionsArr[index]
        
    }
}

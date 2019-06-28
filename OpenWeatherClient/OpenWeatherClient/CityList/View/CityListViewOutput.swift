//
//  CityListViewOutput.swift
//  OpenWeatherClient
//
//  Created by Александр Арсенюк on 28/06/2019.
//  Copyright © 2019 Александр Арсенюк. All rights reserved.
//

import Foundation

protocol CityListViewOutput: AnyObject {
    
    func initialSetup()
    
    func getDataCount() -> Int
    
    func getData(at index: Int) -> City
    
    func getAllData() -> [City]
    
    func removeItem(at index: Int)
    
    func updateItem(with model: CityViewModel, at index: Int)
    
    func makeRequestForCity(city: String)
    
    func getMyCurrentPosition()
}

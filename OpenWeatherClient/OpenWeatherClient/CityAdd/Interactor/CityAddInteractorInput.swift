//
//  CityAddInteractorInput.swift
//  OpenWeatherClient
//
//  Created by Александр Арсенюк on 28/06/2019.
//  Copyright © 2019 Александр Арсенюк. All rights reserved.
//

import Foundation

protocol CityAddInteractorInput: AnyObject {
    
    func isValid(string: String?) -> Bool
    
    func makeRequestForCity(city: String)
}

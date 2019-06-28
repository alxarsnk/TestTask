//
//  CityListTableViewCell.swift
//  OpenWeatherClient
//
//  Created by Александр Арсенюк on 28/06/2019.
//  Copyright © 2019 Александр Арсенюк. All rights reserved.
//

import UIKit

class CityListTableViewCell: UITableViewCell {

    @IBOutlet weak var cityName: UILabel!
    @IBOutlet weak var temperatureValue: UILabel!
    @IBOutlet weak var windSpeedValue: UILabel!
    @IBOutlet weak var windDirectionValue: UILabel!
  
    
    func configureCell(with model: City) {
        
        cityName.text = model.name
        temperatureValue.text = String(model.temperature)
        windSpeedValue.text = String(model.windSpeed)
        windDirectionValue.text = model.windDirection
    }

}

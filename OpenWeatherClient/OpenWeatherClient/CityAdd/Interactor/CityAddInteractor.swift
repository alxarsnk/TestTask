//
//  CityAddInteractor.swift
//  OpenWeatherClient
//
//  Created by Александр Арсенюк on 28/06/2019.
//  Copyright © 2019 Александр Арсенюк. All rights reserved.
//

import UIKit

class CityAddInteractor: CityAddInteractorInput {
    
    var presenter: CityAddInteractorOutput!
    var openWeatherService: OpenWeatherServiceProtocol!
    var coreDataService: CoreDataServiceProtocol!
    
    
    //MARK: - CityAddInteractorInput
    
    func isValid(string: String?) -> Bool {
        
        guard let validString = string else  { return false}
        
        if validString.isEmpty || validString.first == " " {
            return false
        } else {
            return true
        }
    }
    
    func makeRequestForCity(city: String) {
        openWeatherService.makeRequestForCIty(city: city) { [unowned self] (cityModel) in
            
            DispatchQueue.main.async {
            if let cityModel = cityModel {
                
                if !self.coreDataService.isAlredayExist(model: cityModel) {
                    self.coreDataService.saveModel(model: cityModel)
                } else {
                    let index = self.coreDataService.getModelIndex(model: cityModel)
                    self.coreDataService.updateModel(with: cityModel, at: index!)
                    self.presenter.showAlert(title: "Oops..", message: "This city already exists \n We refresh info about it")
                }
            
            } else {
                self.presenter.showAlert(title: "Error", message: "Data about this \ncity is not found")
                }
            }
        }
    }
}

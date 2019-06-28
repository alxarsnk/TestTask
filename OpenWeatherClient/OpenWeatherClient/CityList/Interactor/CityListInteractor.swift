//
//  CityListInteractor.swift
//  OpenWeatherClient
//
//  Created by Александр Арсенюк on 28/06/2019.
//  Copyright © 2019 Александр Арсенюк. All rights reserved.
//

import UIKit

class CityListInteractor: CityListInteractorInput {
    
    var presenter: CityListInteractorOutput!
    var coreDataService: CoreDataServiceProtocol!
    var openWeatherService: OpenWeatherServiceProtocol!
    var locationManager: LocationManagerProtocol!
    
    
    //MARK: - CityListInteractorInput
    
    func initialSetup() {
        locationManager.intialSetup()
    }
    
    func getDataCount() -> Int {
        return coreDataService.fetchModels().count
    }
    
    func getData(at index: Int) -> City {
        
        return coreDataService.fetchModels()[index]
    }
    
    func getAllData() -> [City] {
        return coreDataService.fetchModels()
    }
    
    func removeItem(at index: Int) {
        coreDataService.removeModel(at: index)
    }
    
    func updateItem(with model: CityViewModel, at index: Int) {
        coreDataService.updateModel(with: model, at: index)
    }
    
    func makeRequestForCity(city: String) {
       
        openWeatherService.makeRequestForCIty(city: city) { [unowned self] (cityModel) in
            DispatchQueue.main.async {
                let index = self.coreDataService.getModelIndex(model: cityModel!)
                self.coreDataService.updateModel(with: cityModel!, at: index!)
                  
            }
        }
    }
    
    func getMyCurrentPosition() {
        locationManager.getMyPosition { [unowned self] (latitude, longitude) in
            self.openWeatherService.makeRequestForCoordinates(latitude: latitude, longitude: longitude, complition: { (city) in
                
                DispatchQueue.main.async {
                    self.presenter.showlAler(title: "Your city", message: city!)
                }
            })
        }
    }
}

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
    
    
    //MARK: - CityListInteractorInput
    
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
    
}

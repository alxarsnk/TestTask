//
//  CoreDataService.swift
//  OpenWeatherClient
//
//  Created by Александр Арсенюк on 28/06/2019.
//  Copyright © 2019 Александр Арсенюк. All rights reserved.
//

import Foundation
import UIKit
import CoreData

protocol CoreDataServiceProtocol {
    
    func saveModel(model: CityViewModel)
    
    func removeModel(at number: Int)
    
    func fetchModels() -> [City]
    
    func isAlredayExist(model: CityViewModel) -> Bool
    
    func getModelIndex(model: CityViewModel) -> Int?
    
    func updateModel(with model: CityViewModel, at number: Int)
}

class CoreDataService: CoreDataServiceProtocol {
    
    var cityData: [City] = []
    
    lazy var persistanceContainer: NSPersistentContainer? = {
        
        guard let delegate = UIApplication.shared.delegate as? AppDelegate else {return nil}
        return delegate.persistentContainer
    }()
    
    func saveModel(model: CityViewModel) {
        
        guard let context = persistanceContainer?.viewContext else {return}
        
        let city = City(context: context)
        
        city.name = model.name
        city.temperature = Int32(model.temp)
        city.windSpeed = Int32(model.windSpeed)
        city.windDirection = model.windDirect
        
        
        do {
            cityData.append(city)
            try context.save()
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    func removeModel(at number: Int) {
        
        guard let context = persistanceContainer?.viewContext else {return}
        
        let model = cityData[number]
        context.delete(model)
        
        do {
            cityData.remove(at: number)
            try context.save()
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    func fetchModels() -> [City] {
        
        guard let context = persistanceContainer?.viewContext else {return cityData}
        
        let request: NSFetchRequest<City> = City.fetchRequest()
        
        do {
            try
                cityData = context.fetch(request)
            
        } catch let error {
            print(error.localizedDescription)
        }
        return cityData
    }
    
    func isAlredayExist(model: CityViewModel) -> Bool {
        
        var isExist = false
        
        for city in self.fetchModels() {
            if city.name == model.name {
                isExist = true
            }
        }
        return isExist
    }
    
    func getModelIndex(model: CityViewModel) -> Int? {
        
        var index: Int?
        var count = 0
        for city in self.fetchModels() {
            
            if city.name == model.name {
                index = count
                break
            }
            count += 1
        }
        return index
    }
    
    func updateModel(with model: CityViewModel, at number: Int) {
        
        guard let context = persistanceContainer?.viewContext else {return}
        
        let city = cityData[number]
        
        city.name = model.name
        city.temperature = Int32(model.temp)
        city.windSpeed = Int32(model.windSpeed)
        city.windDirection = model.windDirect
        
        do {
            cityData[number] = city
            try context.save()
        } catch let error {
            print(error.localizedDescription)
        }
    }
}

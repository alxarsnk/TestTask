//
//  CityListPresenter.swift
//  OpenWeatherClient
//
//  Created by Александр Арсенюк on 28/06/2019.
//  Copyright © 2019 Александр Арсенюк. All rights reserved.
//

import Foundation

class CityListPresenter: CityListViewOutput, CityListInteractorOutput {
    
    weak var view: CityListViewInput!
    var interactor: CityListInteractorInput!
    var router: CityListRouterInput!
    
    //MARK: - CityListViewOutput
    
    func initialSetup() {
        interactor.initialSetup()
    }
    
    func getDataCount() -> Int {
        return interactor.getDataCount()
    }
    
    func getData(at index: Int) -> City {
        return interactor.getData(at: index)
    }
    
    func getAllData() -> [City] {
        return interactor.getAllData()
    }
    
    func removeItem(at index: Int) {
        interactor.removeItem(at: index)
    }
    
    func updateItem(with model: CityViewModel, at index: Int) {
        interactor.updateItem(with: model, at: index)
    }
    
    func makeRequestForCity(city: String) {
        interactor.makeRequestForCity(city: city)
    }
    
    func getMyCurrentPosition() {
        interactor.getMyCurrentPosition()
    }
    
    //MARK: - CityListInteractorOutput
    
    func showlAler(title: String, message: String) {
        view.showlAler(title: title, message: message)
    }
}

//
//  CityAddPresenter.swift
//  OpenWeatherClient
//
//  Created by Александр Арсенюк on 28/06/2019.
//  Copyright © 2019 Александр Арсенюк. All rights reserved.
//

import Foundation

class CityAddPresenter: CityAddViewOutput, CityAddInteractorOutput {
    
    weak var view: CityAddViewInput!
    var interactor: CityAddInteractorInput!
    var router: CityAddRouterInput!
    
    //MARK: - CityAddViewOutput
    
    func setupInitialState() {
        
    }
    
    func isValid(string: String?) -> Bool {
       return interactor.isValid(string: string)
    }
    
    func makeRequestForCity(city: String) {
        interactor.makeRequestForCity(city: city)
    }
    
    //MARK: - CityAddInteractorOutput
    
    func popViewController() {
        router.popViewController()
    }
    
    func showAlert(title: String, message: String)  {
        view.showAlert(title: title, message: message)
    }
}

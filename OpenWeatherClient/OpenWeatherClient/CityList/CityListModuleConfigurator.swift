//
//  CityListModuleConfigurator.swift
//  OpenWeatherClient
//
//  Created by Александр Арсенюк on 28/06/2019.
//  Copyright © 2019 Александр Арсенюк. All rights reserved.
//

import Foundation
import UIKit

class CityListModuleConfigurator: NSObject {
    
    @IBOutlet weak var viewController: UIViewController!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        configureModule()
    }
    
    func configureModule() {
        
        let viewController = self.viewController as! CityListViewController
        let presenter = CityListPresenter()
        let interactor = CityListInteractor()
        let router = CityListRouter()
        let coreDataService = CoreDataService()
        let openWeatherService = OpenWeatherService()
        let locationManager = LocationManager()
        
        viewController.presenter = presenter
        
        presenter.view = viewController
        presenter.interactor = interactor
        presenter.router = router

        interactor.presenter = presenter
        interactor.coreDataService = coreDataService
        interactor.openWeatherService = openWeatherService
        interactor.locationManager = locationManager
 
        router.view = viewController
    }
}

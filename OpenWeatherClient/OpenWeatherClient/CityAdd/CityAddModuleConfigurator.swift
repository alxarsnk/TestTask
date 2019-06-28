//
//  CityAddModuleConfigurator.swift
//  OpenWeatherClient
//
//  Created by Александр Арсенюк on 28/06/2019.
//  Copyright © 2019 Александр Арсенюк. All rights reserved.
//

import Foundation
import UIKit

class CityAddModuleConfigurator: NSObject {
    
    @IBOutlet weak var viewController: UIViewController!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        configureModule()
    }
    
    func configureModule() {
        
        let viewController = self.viewController as! CityAddViewController
        let presenter = CityAddPresenter()
        let interactor = CityAddInteractor()
        let router = CityAddRouter()
        let openWeatherService = OpenWeatherService()
        let coreDataService = CoreDataService()
        
        viewController.presenter = presenter
        
        presenter.view = viewController
        presenter.interactor = interactor
        presenter.router = router

        interactor.presenter = presenter
        interactor.openWeatherService = openWeatherService
        interactor.coreDataService = coreDataService

        router.view = viewController
    }
}

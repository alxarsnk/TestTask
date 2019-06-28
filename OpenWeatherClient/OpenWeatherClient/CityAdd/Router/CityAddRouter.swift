//
//  CityAddRouter.swift
//  OpenWeatherClient
//
//  Created by Александр Арсенюк on 28/06/2019.
//  Copyright © 2019 Александр Арсенюк. All rights reserved.
//

import UIKit

class CityAddRouter: CityAddRouterInput {
    
    weak var view: UIViewController!
    
    //MARK: - CityAddRouterInput
    
    func popViewController() {
        view.navigationController?.popViewController(animated: true)
    }
    
    
}

//
//  CityAddViewController.swift
//  OpenWeatherClient
//
//  Created by Александр Арсенюк on 28/06/2019.
//  Copyright © 2019 Александр Арсенюк. All rights reserved.
//

import UIKit

class CityAddViewController: UIViewController, CityAddViewInput {
    
    @IBOutlet weak var textField: UITextField!
    var presenter: CityAddViewOutput!
    
    //MARK: - Методы
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.setupInitialState()
    }

   
    @IBAction func searchButtonPressed(_ sender: Any) {
        
        if !presenter.isValid(string: textField.text) {
            showAlert(with: "Error", message: "City doesn't exists\nEnter correct name of the city")
        } else {
            presenter.makeRequestForCity(city: textField.text!)
        }
    }
    
    private func showAlert(with title: String, message: String) {
        
        let okButtonTitle = "OK"
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: okButtonTitle, style: .default, handler: nil)
        alert.addAction(alertAction)
        present(alert, animated: true, completion: nil)
    }
    //MARK: - CityAddViewInput
    
    func showAlert(title: String, message: String) {
        showAlert(with: title, message: message)
    }
    
}

//
//  CityListViewController.swift
//  OpenWeatherClient
//
//  Created by Александр Арсенюк on 28/06/2019.
//  Copyright © 2019 Александр Арсенюк. All rights reserved.
//

import UIKit

class CityListViewController: UIViewController, CityListViewInput {
    
    var presenter: CityListViewOutput!
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: - Методы
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        presenter.initialSetup()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableView.reloadData()
    }
   
    @IBAction func myLocationButtonPressed(_ sender: Any) {
        presenter.getMyCurrentPosition()
    }
    
    private func showAlert(with title: String, message: String) {
        
        let okButtonTitle = "OK"
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: okButtonTitle, style: .default, handler: nil)
        alert.addAction(alertAction)
        present(alert, animated: true, completion: nil)
    }
    
    //MARK: - CityListViewInput
    
    func showlAler(title: String, message: String) {
        showAlert(with: title, message: message)
    }
}

extension CityListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return presenter.getDataCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let cellIdentifier = "cellIdentifier"
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! CityListTableViewCell
        let cellModel = presenter.getData(at: indexPath.row)
        
        cell.configureCell(with: cellModel)
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            
            presenter.removeItem(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let cell = tableView.cellForRow(at: indexPath) as! CityListTableViewCell
        let cityName = cell.cityName.text
        presenter.makeRequestForCity(city: cityName!)
        tableView.reloadRows(at: [indexPath], with: .fade)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

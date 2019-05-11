//
//  SharedViewController.swift
//  BadiTechTest
//
//  Created by Sebastian Gelabert on 10/05/2019.
//  Copyright © 2019 Sebastian Gelabert. All rights reserved.
//

import UIKit

class SharedViewController: UIViewController, NetworkDelegate {
    
    let activityIndicator = UIActivityIndicatorView(style: .gray)

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func startActivityIndicator() {
        view.addSubview(activityIndicator)
        activityIndicator.frame = view.bounds
        activityIndicator.startAnimating()
    }
    
    func stopActivityIndicator() {
        activityIndicator.removeFromSuperview()
    }
    
    func startLoading(_ idRequest: String) {
        startActivityIndicator()
    }
    
    func stopLoadingWithSucces(_ idRequest: String) {
        stopActivityIndicator()
    }
    
    func stopLoadingWithError(_ idRequest: String) {
        stopActivityIndicator()
        let alert = UIAlertController(title: Constants.TITLE_ERROR, message: Constants.BODY_ERROR, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: Constants.BUTTON_ERROR, style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func boardingMessage() {
        let alert = UIAlertController(title: Constants.TITLE_BOARDING, message: Constants.BODY_BOARDING, preferredStyle: UIAlertController.Style.actionSheet)
        alert.addAction(UIAlertAction(title: Constants.BUTTON_BOARDING, style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func noRecipesFoundAlert() {
        let alert = UIAlertController(title: Constants.TITLE_NOT_FOUND_RECIPE, message: Constants.BODY_NOT_FOUND_RECIPE, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: Constants.BUTTON_NOT_FOUND_RECIPE, style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
}

//
//  SharedViewController.swift
//  BadiTechTest
//
//  Created by Sebastian Gelabert on 10/05/2019.
//  Copyright © 2019 Sebastian Gelabert. All rights reserved.
//

import UIKit

class SharedViewController: UIViewController, NetworkDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func startLoading(_ idRequest: String) {
        print("startloading")
    }
    
    func stopLoadingWithSucces(_ idRequest: String) {
        print("stop WITH SUCCESS")
    }
    
    func stopLoadingWithError(_ idRequest: String) {
        print("STOP WITH FAILURE")
    }
    
}

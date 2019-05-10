//
//  NetworkDelegate.swift
//  BadiTechTest
//
//  Created by Sebastian Gelabert on 10/05/2019.
//  Copyright © 2019 Sebastian Gelabert. All rights reserved.
//

import Foundation

protocol NetworkDelegate: AnyObject {
    func startLoading(_ idRequest: String)
    func stopLoadingWithSucces(_ idRequest: String)
    func stopLoadingWithError(_ idRequest: String)
}

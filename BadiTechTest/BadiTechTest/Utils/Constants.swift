//
//  Constants.swift
//  BadiTechTest
//
//  Created by Sebastian Gelabert on 10/05/2019.
//  Copyright © 2019 Sebastian Gelabert. All rights reserved.
//

import Foundation

struct Constants {
    static let API_BASE_URL = "http://www.recipepuppy.com/api/?i="
    static let PAGINATION = "&p=1"
    
    static let NOT_NEEDED_ID = "ID not needed"
    
    static let SEARCH = "Search"
    
    static let TITLE_BOARDING = "Welcome!"
    static let BODY_BOARDING = "Use the search bar to look for recipes, just type the ingredients you want to use separated by commas"
    static let BUTTON_BOARDING = "Okay"
    
    
    
    static let TITLE_ERROR = "Error with API"
    static let BODY_ERROR = "Couldn't request data from the server"
    static let BUTTON_ERROR = "Ok"
    
    static let TITLE_NOT_FOUND_RECIPE = "There are no results"
    static let BODY_NOT_FOUND_RECIPE = "We can't find recipes with the ingredients provided"
    static let BUTTON_NOT_FOUND_RECIPE = "Ok"
    
    static let WHITESPACE_CHEESE = " cheese"
    static let CHEESE = "cheese"
    static let WHITESPACE_MILK = " milk"
    static let MILK = "milk"
}

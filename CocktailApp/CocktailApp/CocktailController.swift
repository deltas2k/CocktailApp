//
//  CocktailController.swift
//  CocktailApp
//
//  Created by Matthew O'Connor on 10/2/19.
//  Copyright © 2019 Matthew O'Connor. All rights reserved.
//

import UIKit

class CocktailController {
    private static let baseURL = URL(string: "https://www.thecocktaildb.com/api/json/v1/1/")
    
    static func getCocktail(with searchTerm: String, completion: @escaping (TopLevelDictionary?) -> Void) {
        
        let urlComponent = baseURL?.appendingPathComponent("search.php")
        
    }
    
}

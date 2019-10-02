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
        guard let url = urlComponent else {return }
        var components = URLComponents(url: url, resolvingAgainstBaseURL: true)
        let queryCocktail = URLQueryItem(name: "s", value: searchTerm)
        components?.queryItems = [queryCocktail]
        
        guard let finalURL = components?.url else {return}
        print(finalURL)
        
        URLSession.shared.dataTask(with: finalURL) { (data, _, error) in
            if let error = error {
                print("Error in \(#function) : \(error.localizedDescription) \n---\n \(error)")
            }
            
            if let data = data {
                do {
                    let cocktail = try JSONDecoder().decode(TopLevelDictionary.self, from: data)
                    completion(cocktail)
                } catch {
                    print("Error in \(#function) : \(error.localizedDescription) \n---\n \(error)")
                    completion(nil); return
                }
            }
        }
    .resume()
    }
    
    static func getImage(cocktail: TopLevelDictionary, completion: @escaping (UIImage?) -> Void) {
        let finalURL = cocktail.drinks[0].strDrinkThumb
        URLSession.shared.dataTask(with: finalURL) { (data, _, error) in
            if let error = error {
                print("Error in \(#function) : \(error.localizedDescription) \n---\n \(error)")
            }
            if let data = data {
                guard let image = UIImage(data: data) else {return}
                completion(image)
                }
            }
        .resume()
    }
        
}

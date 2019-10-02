//
//  Cocktails.swift
//  CocktailApp
//
//  Created by Matthew O'Connor on 10/2/19.
//  Copyright © 2019 Matthew O'Connor. All rights reserved.
//

import UIKit

struct TopLevelDictionary: Decodable {
    let drinks: [Drinks]
}

struct Drinks: Decodable {
    let strDrinkThumb: URL
    let strDrink: String
    let strCategory: String
    let strIBA: String
    let strGlass: String
    let strIngredient1: String
    let strMeasure1: String
    let strIngredient2: String
    let strMeasure2: String
    let strIngredient3: String
    let strMeasure3: String
    let strIngredient4: String
    let strMeasure4: String
    let strIngredient5: String
    let strMeasure5: String
    let strIngredient6: String
    let strMeasure6: String
    let strIngredient7: String
    let strMeasure7: String
    let strInstructions: String
}

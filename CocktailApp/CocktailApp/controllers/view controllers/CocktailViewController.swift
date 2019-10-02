//
//  CocktailViewController.swift
//  CocktailApp
//
//  Created by Matthew O'Connor on 10/2/19.
//  Copyright © 2019 Matthew O'Connor. All rights reserved.
//

import UIKit

class CocktailViewController: UIViewController {
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var cocktailImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var glassLabel: UILabel!
    @IBOutlet weak var ingreditent1Label: UILabel!
    @IBOutlet weak var amount1Label: UILabel!
    @IBOutlet weak var ingredient2Label: UILabel!
    @IBOutlet weak var amount2Label: UILabel!
    @IBOutlet weak var instructionsLabel: UILabel!
    @IBOutlet weak var ingredient3Label: UILabel!
    @IBOutlet weak var amount3Label: UILabel!
    @IBOutlet weak var ingredient4Label: UILabel!
    @IBOutlet weak var amount4Label: UILabel!
    @IBOutlet weak var ingredient5Label: UILabel!
    @IBOutlet weak var amount5Label: UILabel!
    @IBOutlet weak var ingredient6Label: UILabel!
    @IBOutlet weak var amount6Label: UILabel!
    @IBOutlet weak var ingredient7Label: UILabel!
    @IBOutlet weak var amount7Label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        // Do any additional setup after loading the view.
    }
    
    func updateViews(cocktail: TopLevelDictionary, image: UIImage) {
    DispatchQueue.main.async {
        self.cocktailImageView.image = image
        self.nameLabel.text = cocktail.drinks[0].strDrink
        self.categoryLabel.text = cocktail.drinks[0].strCategory
        self.glassLabel.text = cocktail.drinks[0].strGlass
        self.ingreditent1Label.text = cocktail.drinks[0].strIngredient1
        self.amount1Label.text = cocktail.drinks[0].strMeasure1
        self.ingredient2Label.text = cocktail.drinks[0].strIngredient2
        self.amount2Label.text = cocktail.drinks[0].strMeasure2
        self.instructionsLabel.text = cocktail.drinks[0].strInstructions
        self.ingredient3Label.text = cocktail.drinks[0].strIngredient3
        self.amount3Label.text = cocktail.drinks[0].strMeasure3
        self.ingredient4Label.text = cocktail.drinks[0].strIngredient4
        self.amount4Label.text = cocktail.drinks[0].strMeasure4
        self.ingredient5Label.text = cocktail.drinks[0].strIngredient5
        self.amount5Label.text = cocktail.drinks[0].strMeasure5
        self.ingredient6Label.text = cocktail.drinks[0].strIngredient6
        self.amount6Label.text = cocktail.drinks[0].strMeasure6
        self.ingredient7Label.text = cocktail.drinks[0].strIngredient7
        self.amount7Label.text = cocktail.drinks[0].strMeasure7
        }
        
    }

}

extension CocktailViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//        guard let searchText = searchBar.text else {print("missing searchtext"); return}
        CocktailController.getCocktail(with: searchText.lowercased()) { (cocktail) in
            guard let cocktail = cocktail else {print("no cocktail");return}
            CocktailController.getImage(cocktail: cocktail) { (image) in
                guard let image = image else {print("no image");return}
                self.updateViews(cocktail: cocktail, image: image)
            }
        }
    }
}

//
//  RecipeCell.swift
//  Recipe Search
//
//  Created by Mohamed Elkazzaz on 26/11/2021.
//

import UIKit

class RecipeCell: UITableViewCell {

    @IBOutlet weak var productImg: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var sourceLbl: UILabel!
    @IBOutlet weak var recipeHealthLbl: UILabel!
    
    
    func setup(recipe: RecipeModel?){
        titleLbl.text = recipe?.title
        sourceLbl.text = recipe?.source_url
       
    }
    
    
}

//
//  Recipe Model.swift
//  Recipe Search
//
//  Created by Mohamed Elkazzaz on 28/11/2021.
//

import Foundation


struct RecipesModel:Codable {
    var recipes:[RecipeModel]?
}

struct RecipeModel:Codable {
    var publisher: String?
    var title: String?
    var source_url: String?
    var recipe_id: String?
    var image_url:String?
    var publisher_url: String?
}

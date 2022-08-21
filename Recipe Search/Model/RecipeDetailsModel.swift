//
//  RecipeDetailsModel.swift
//  Recipe Search
//
//  Created by Mohamed Elkazzaz on 28/11/2021.
//

import Foundation

struct RecipeDetailsModel:Codable {
    var recipe:RecipeDetailsInfoModel?
}

struct RecipeDetailsInfoModel:Codable {
    var publisher:String?
    var ingredients: [String]?
    var source_url:String?
    var recipe_id: String?
    var image_url: String?
    var publisher_url: String?
    var title:String?
}

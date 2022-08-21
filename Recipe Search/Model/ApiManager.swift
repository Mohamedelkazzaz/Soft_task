//
//  ApiManager.swift
//  Recipe Search
//
//  Created by Mohamed Elkazzaz on 28/11/2021.
//

import Foundation
import Alamofire

class ApiManager {
    
    private var headers: HTTPHeaders = [
        "Accept": "application/json"
    ]

private let EncodingType = JSONEncoding.default
enum Apis {
    
    case recipeSearch,  recipeDetails
    
    
    var description: String {
        let url = "https://api.edamam.com"
        switch self {
        case . recipeSearch:   return url + "/api/recipes/v2"
        case .recipeDetails:   return url + "/api/recipes/v2/{id}"
        
        }
    }
    
 }
    
    public func recipeSearch(q:String,completion: @escaping (_ :[RecipeModel]?,_ :Error?) -> Void){
    
        let par = [
            "q" : q
            ] as [String : Any]
        
        AF.request( Apis.recipeSearch.description,
                           method: .get,
                           parameters: par,
                           encoding: JSONEncoding.default,
                           headers: headers)
            .responseJSON{ (response:DataResponse) in
                switch(response.result) {
                case .success( _):
                    if (response.response?.statusCode ?? 400) > 300{
                        do{
                            let error = try JSONDecoder().decode(Errors.self, from: response.data ?? Data())
                            completion(nil, error)
                        }catch(let e){
                            completion(nil,e)
                        }
                    }else{
                        
                        do{
                            let recipe = try JSONDecoder().decode([RecipeModel].self, from: response.data ?? Data())
                            print(recipe)
                            completion(recipe, nil)
                            
                        }catch(let e){
                            completion(nil,e)
                            print(e)
                        }
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                    completion(nil,error)
                }
        }
    }
    
    public func recipeDetails(rid:String,completion: @escaping (_ :[RecipeModel]?,_ :Error?) -> Void){
    
        let par = [
            "rid" : rid
            ] as [String : Any]
        
        AF.request( Apis.recipeSearch.description + "\(rid)",
                           method: .get,
                           parameters: par,
                           encoding: JSONEncoding.default
                           )
            .responseJSON{ (response:DataResponse) in
                switch(response.result) {
                case .success( _):
                    if (response.response?.statusCode ?? 400) > 300{
                        do{
                            let error = try JSONDecoder().decode(Errors.self, from: response.data ?? Data())
                            completion(nil, error)
                        }catch(let e){
                            completion(nil,e)
                        }
                    }else{
                        
                        do{
                            let recipe = try JSONDecoder().decode([RecipeModel].self, from: response.data ?? Data())
                            print(recipe)
                            completion(recipe, nil)
                            
                        }catch(let e){
                            completion(nil,e)
                            print(e)
                        }
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                    completion(nil,error)
                }
        }
    }
    
    
}

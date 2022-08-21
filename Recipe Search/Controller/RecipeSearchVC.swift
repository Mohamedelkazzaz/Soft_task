//
//  RecipeSearchVC.swift
//  Recipe Search
//
//  Created by Mohamed Elkazzaz on 28/11/2021.
//

import UIKit
import Alamofire

class RecipeSearchVC: UIViewController {

    @IBOutlet weak var filterCollectionView: UICollectionView!
    @IBOutlet weak var search: UISearchBar!
    
    @IBOutlet weak var tableView: UITableView!
    
    
    let titlesArr = ["ALL","Low Sugar","Keto","Vegan"]
    var recipe: [RecipeModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib.init(nibName: "RecipeCell", bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: "RecipeCell")

        filterCollectionView.delegate = self
        filterCollectionView.dataSource = self
        
        tableView.dataSource = self
        tableView.delegate = self
        
        getRecipe()
        
    
    }
    

    private func getRecipe(q: String? = nil){
        ApiManager().recipeSearch(q: q ?? "") { (recipes, error) in
            if let error = error{
                if let myError = error as? Errors{
                    print("error")
                }else{
                    print("gf")
                }
                return
            }
            
//            self.staduimlist = staduims ?? []
            self.recipe = recipes ?? []
            self.tableView.reloadData()
            
            
        }
    }

}

extension RecipeSearchVC: UICollectionViewDataSource,UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return titlesArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FilterCell", for: indexPath) as! FilterCell
        cell.setup(text: titlesArr[indexPath.row])
        return cell
    }
    
    
    
}

extension RecipeSearchVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipe.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RecipeCell", for: indexPath) as! RecipeCell
        cell.setup(recipe: recipe[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let VC = storyboard?.instantiateViewController(withIdentifier: "RecipeDetailsVC") as! RecipeDetailsVC
            
            self.navigationController?.pushViewController(VC , animated: true)
    }
    
    
}

//
//  FilterCell.swift
//  Recipe Search
//
//  Created by Mohamed Elkazzaz on 28/11/2021.
//

import UIKit

class FilterCell: UICollectionViewCell {
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var lblView: UIView!
    
    func setup(text:String){
        lblView.layer.borderWidth = 1
        nameLbl.text = text
    }
    
}

//
//  CategoryTableViewCell.swift
//  MVVM-VS-APP
//
//  Created by Alexey on 20.11.2020.
//

import UIKit

class CategoryTableViewCell: UITableViewCell {
    @IBOutlet weak var categoryIcon: UIImageView!
    @IBOutlet weak var categoryLabel: UILabel!
    
    //MARK: - Loading image from network
    var icon: String? {
        didSet {
            icon = "http://blackstarshop.ru/\(icon ?? "")"
            if let url = URL(string: icon! ) {
                categoryIcon.load(url: url)
            }
        }
    }
}


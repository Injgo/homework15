//
//  filteredCollectionViewCell.swift
//  homework15
//
//  Created by Dato on 17.07.22.
//

import UIKit

class filteredCollectionViewCell: UICollectionViewCell {
    static let identifier  =  "\(filteredCollectionViewCell.self)"
    
    
    @IBOutlet weak var background: UIView!
    @IBOutlet weak var img: UIImageView!
    
    override func awakeFromNib() {
        background.layer.cornerRadius = 12
        img.layer.cornerRadius = 12
    }
    
}

//
//  MovieCollectionViewCell.swift
//  homework15
//
//  Created by Dato on 15.07.22.
//

import UIKit

class MovieCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "\(MovieCollectionViewCell.self)"
    
    @IBOutlet weak var background: UIView!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var genreLabel: UILabel!
    
    
    override func awakeFromNib() {
        background.layer.cornerRadius = 12
        image.layer.cornerRadius = 12
    }
    
}

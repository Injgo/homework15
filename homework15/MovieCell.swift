//
//  MovieCell.swift
//  homework15
//
//  Created by Dato on 13.07.22.
//

import UIKit

class MovieCell: UITableViewCell {
    
    static let identifier = "MovieCell"
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var imdb: UILabel!
    @IBOutlet weak var isfavouriteButton: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

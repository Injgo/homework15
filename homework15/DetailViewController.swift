//
//  DetailViewController.swift
//  homework15
//
//  Created by Dato on 13.07.22.
//

import UIKit

class DetailViewController: UIViewController {
    
    
    
    @IBOutlet var isfavouriteButton: UIButton!
    
    
    
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var imdbLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var seenSwitcher: UISwitch!
    
    @IBOutlet weak var descriptionLabel: UITextView!
    
    var movie : Movie!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        movieTitleLabel.text = movie.title
        authorLabel.text = movie.mainActor
        imdbLabel.text = "\(movie.imdb)"
        dateLabel.text = movie.releaseDate
        seenSwitcher.isOn = movie.seen
        descriptionLabel.text = movie.description
        isfavouriteButton.setImage(UIImage(systemName: movie.isFavourite ? "bookmark.fill" : "bookmark" ),for: .normal)
    }
    
    
    
    @IBAction func updateChanges() {
        Movies.update(movie: movie)
        navigationController?.popViewController(animated: true)
        
    }
    
    @IBAction func favouritebuttonClicked() {
        movie.isFavourite.toggle()
        let image = movie.isFavourite ? "bookmark.fill" : "bookmark"
        isfavouriteButton.setImage(UIImage(systemName: image), for: .normal)
    }
    
    @IBAction func seenbuttonswitch() {
        movie.seen.toggle()
    }
    
}

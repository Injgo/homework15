//
//  DetailViewController.swift
//  homework15
//
//  Created by Dato on 13.07.22.
//

import UIKit

class DetailViewController: UIViewController {
    
    var movie : Movie!
    
    @IBOutlet weak var isfavouriteButton: UIButton!
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var imdbLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var seenSwitcher: UISwitch!
    @IBOutlet weak var descriptionLabel: UITextView!
    
    @IBOutlet weak var movieImg: UIImageView!
    
    
    @IBOutlet weak var filteredCollectionView: UICollectionView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
       
    }
    private var filteredCollectionList = [Movie]()
    
    
    private func configure(){
        filteredCollectionView.delegate = self
        filteredCollectionView.dataSource = self
        getfilterData(with: movie.genre)
        
        
        movieTitleLabel.text = movie.title
        authorLabel.text = movie.mainActor
        imdbLabel.text = "\(movie.imdb)"
        dateLabel.text = movie.releaseDate
        seenSwitcher.isOn = movie.seen
        descriptionLabel.text = movie.description
        isfavouriteButton.setImage(UIImage(systemName: movie.isFavourite ? "bookmark.fill" : "bookmark" ),for: .normal)
        movieImg.image = UIImage(named: movie.Img)
        
    }
    
    private func getfilterData(with genre: Genre) {
        filteredCollectionList.removeAll()
        Movies.movieList.filter{ $0.genre == genre}.forEach{filteredCollectionList.append($0)}
        filteredCollectionView.reloadData()
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
	

extension DetailViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        filteredCollectionList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: filteredCollectionViewCell.identifier, for: indexPath) as? filteredCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.img.image = UIImage(named: filteredCollectionList[indexPath.row].Img)
        return cell
    }
   
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let width  = (view.frame.width-20)/3
        return CGSize(width: 150 , height: 200)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        5
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        guard let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController else { return }
        let movieTT =  filteredCollectionList[indexPath.row]
        vc.movie = movieTT
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
}

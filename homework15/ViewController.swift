//
//  ViewController.swift
//  homework15
//
//  Created by Dato on 13.07.22.
//

import UIKit


class MovieHeaderView: UITableViewHeaderFooterView{
    
    static let reuseIdenifier = "\(MovieHeaderView.self)"
    
    static var nib: UINib {
            return UINib(nibName: String(describing: self), bundle: nil)
        }
    
    
    @IBOutlet weak var titleLable: UILabel? {
        get {return _textLabel}
        set { _textLabel = newValue}
    }
    private var _textLabel: UILabel?
        
}




class ViewController: UIViewController {
    
    enum Section: String, CaseIterable{
        case new =  "new"
        case isFavourite = "Favourite"
    }

    let images = ["all", "comedy", "action", "drama"]

    private var newMovies = [Movie]()
    private var favouriteMovies = [Movie]()
    

    @IBOutlet weak var moviesTableView: UITableView!
    @IBOutlet weak var movieGenreCollectionView: UICollectionView!
    
    
    @IBOutlet weak var sortByFavourite: UIBarButtonItem!
    @IBOutlet weak var sortBySeen: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sortMovies()
        moviesTableView.delegate = self
        moviesTableView.dataSource = self
        moviesTableView.register(MovieHeaderView.nib, forHeaderFooterViewReuseIdentifier: MovieHeaderView.reuseIdenifier)
        moviesTableView.reloadData()
        
        
        
    }

    override func viewWillAppear(_ animated: Bool) {
        sortMovies()
        moviesTableView.reloadData()
    }
    
    
    private func sortMovies(){
        favouriteMovies.removeAll()
        newMovies.removeAll()
        Movies.movieList.forEach{
            if !$0.isFavourite{
                newMovies.append($0)
            }else {
                favouriteMovies.append($0)
            }
        }
    }

}


extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieCollectionViewCell.identifier, for: indexPath) as? MovieCollectionViewCell else { return UICollectionViewCell()}
        
        cell.image.image = UIImage(named: images[indexPath.row])
        cell.genreLabel.text = images[indexPath.row]
        return cell
    }
    
}



extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let view  =  moviesTableView.dequeueReusableHeaderFooterView(withIdentifier: MovieHeaderView.reuseIdenifier) as? MovieHeaderView else {return nil}
        if section == 0 {
            view.titleLable?.text = "\(Section.new.rawValue)"
        }else {
            view.titleLable?.text = "\(Section.isFavourite.rawValue)"
        }
        return view
        
    }
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return  60
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        Section.allCases.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return newMovies.count
        }else {
            return favouriteMovies.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            let newMovie = newMovies[indexPath.row]
            guard let cell = moviesTableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as? MovieCell
            else { return UITableViewCell()}
            cell.title.text = newMovie.title
            cell.imdb.text = "\(newMovie.imdb)"
            cell.isfavouriteButton.image = UIImage(systemName: newMovie.isFavourite ? "bookmark.fill" : "bookmark")
            return cell
            
        } else {
            let favouriteMove = favouriteMovies[indexPath.row]
            guard let cell = moviesTableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as? MovieCell
            else { return UITableViewCell()}
            cell.title.text = favouriteMove.title
            cell.imdb.text = "\(favouriteMove.imdb)"
            cell.isfavouriteButton.image = UIImage(systemName: favouriteMove.isFavourite ? "bookmark.fill" : "bookmark")
            return cell
        }
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        guard let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController else { return }
        
        if indexPath.section == 0 {
            let movie = newMovies[indexPath.row]
            vc.movie = movie
        }else {
            let movie = favouriteMovies[indexPath.row]
            vc.movie = movie
        }
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        72
    }
    
}


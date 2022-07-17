//
//  ViewController.swift
//  homework15
//
//  Created by Dato on 13.07.22.
//

import UIKit


class MovieHeaderView: UITableViewHeaderFooterView{
    
    static let reuseIdenifier = "\(MovieHeaderView.self)"
    
    private var _textLabel: UILabel?
    
    @IBOutlet weak var titleLable: UILabel? {
        get {return _textLabel}
        set { _textLabel = newValue}
    }
    static var nib: UINib {
            return UINib(nibName: String(describing: self), bundle: nil)
        }
    
}




class ViewController: UIViewController {
    
    enum Section: String, CaseIterable{
        case new =  "new"
        case isFavourite = "Favourite"
    }

    let images = ["all", "comedy", "action", "drama"]

    private var allMovies = [Movie]()
    private var filteredMovies = [Movie]()
    

    @IBOutlet weak var moviesTableView: UITableView!
    @IBOutlet weak var movieGenreCollectionView: UICollectionView!
    
    
    @IBOutlet weak var sortByFavourite: UIBarButtonItem!
    @IBOutlet weak var sortBySeen: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        filterByCategory(with: .all)
        moviesTableView.delegate = self
        moviesTableView.dataSource = self
        moviesTableView.register(MovieHeaderView.nib, forHeaderFooterViewReuseIdentifier: MovieHeaderView.reuseIdenifier)
        moviesTableView.reloadData()
        
        
        
    }

    override func viewWillAppear(_ animated: Bool) {
        filterByCategory(with: .all)
        moviesTableView.reloadData()
    }
    
    private func filterByCategory (with category: Genre) {
        allMovies.removeAll()
        filteredMovies.removeAll()
        switch category {
        case .all:
            Movies.movieList.forEach{allMovies.append($0)}
        case .comedy:
            Movies.movieList.filter{$0.genre == .comedy}.forEach{filteredMovies.append($0)}
        case .drama:
            Movies.movieList.filter{$0.genre == .drama}.forEach{filteredMovies.append($0)}
        case .action:
            Movies.movieList.filter{$0.genre == .action}.forEach{filteredMovies.append($0)}
        }
        moviesTableView.reloadData()
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
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        let category = Genre(rawValue: indexPath.row)
        filterByCategory(with: category ?? .all)
    }

}



extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let view  =  moviesTableView.dequeueReusableHeaderFooterView(withIdentifier: MovieHeaderView.reuseIdenifier) as? MovieHeaderView else { return nil }
        
        let movieGenre = filteredMovies.first?.genre
        
        if movieGenre == nil {
            view.titleLable?.text = "All Movies"
        }else {
            if let mvGente = movieGenre {
                view.titleLable?.text = "\(mvGente)"
            }
        }
        return view
        
    }    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return  60
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
       1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 && filteredMovies.isEmpty{
            return allMovies.count
        }else {
            return filteredMovies.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 && filteredMovies.isEmpty {
            let newMovie = allMovies[indexPath.row]
            guard let cell = moviesTableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as? MovieCell
            else { return UITableViewCell()}
            cell.moviewImage.image = UIImage(named: newMovie.Img)
            cell.title.text = newMovie.title
            cell.imdb.text = "\(newMovie.imdb)"
            cell.isfavouriteButton.image = UIImage(systemName: newMovie.isFavourite ? "bookmark.fill" : "bookmark")
            return cell
            
        } else {
            let favouriteMove = filteredMovies[indexPath.row]
            guard let cell = moviesTableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as? MovieCell
            else { return UITableViewCell()}
            cell.moviewImage.image = UIImage(named: favouriteMove.Img)
            cell.title.text = favouriteMove.title
            cell.imdb.text = "\(favouriteMove.imdb)"
            cell.isfavouriteButton.image = UIImage(systemName: favouriteMove.isFavourite ? "bookmark.fill" : "bookmark")
            return cell
        }
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController else { return }
        if !filteredMovies.isEmpty {
            let movie  = filteredMovies[indexPath.row]
            vc.movie = movie
        }else {
            let movie = allMovies[indexPath.row]
            vc.movie = movie
        }
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
    
}


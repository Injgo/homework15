//
//  Models.swift
//  homework15
//
//  Created by Dato on 13.07.22.
//

import Foundation

enum Genre:Int, CaseIterable {
    case all = 0, comedy, action, drama
}

struct Movie {
    			
    let title: String
    let releaseDate: String
    let imdb: Double
    let mainActor: String
    var seen: Bool
    var isFavourite: Bool
    let Img: String
    let description = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum"
    let genre: Genre
    
    
}

struct Movies {
    static var movieList: [Movie] =  [
        Movie(title: "THE INTOUCHABLES", releaseDate: "2011", imdb: 8.5, mainActor: "François Cluzet", seen: true, isFavourite: false, Img: "Intouchables", genre: .comedy),
        Movie(title: "3 IDIOTS", releaseDate: "2009", imdb: 8.4, mainActor: "Aamir Khan", seen: false, isFavourite: false, Img: "3idiots" ,genre: .comedy),
        Movie(title: "DOG", releaseDate: "2022", imdb: 6.5, mainActor: "Channing Tatum", seen: true, isFavourite: true, Img: "dog", genre: .comedy),
        Movie(title: "AMERICAN ULTRA", releaseDate: "2015", imdb: 6.1, mainActor: "Jesse Eisenberg", seen: false, isFavourite: false, Img: "american_ultra", genre: .comedy),
        Movie(title: "DADDY'S HOME 2", releaseDate: "2017", imdb: 6.0, mainActor: "John Lithgow", seen: false, isFavourite: false, Img: "daddy's_home", genre: .comedy),
        Movie(title: "FORTRESS", releaseDate: "2021", imdb: 3.4, mainActor: "Bruce Willis", seen: false, isFavourite: false, Img: "fortress", genre: .action),
        Movie(title: "GLADIATOR", releaseDate: "2000", imdb: 8.5, mainActor: "Russell Crowe", seen: false, isFavourite: false, Img: "gladiator", genre: .action),
        Movie(title: "THE MATRIX", releaseDate: "1999", imdb: 8.7, mainActor: "Keanu Reeves", seen: true, isFavourite: false, Img: "matrix", genre: .action),
        Movie(title: "Schindler's List", releaseDate: "1993", imdb: 8.9, mainActor: "Liam Neeson", seen: true, isFavourite: true, Img: "godfather",genre: .drama),
        Movie(title: "THE GODFATHER", releaseDate: "1972", imdb: 9.2, mainActor: "Marlon Brando", seen: true, isFavourite: true, Img: "Schindler's_List",genre: .drama),

    ]
    
    
    
    static func update(movie: Movie) {
        guard let movieIndex = Movies.movieList.firstIndex(where: {$0.title == movie.title}) else {return}
        Movies.movieList[movieIndex] = movie
    }
    
}










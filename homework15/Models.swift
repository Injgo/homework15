//
//  Models.swift
//  homework15
//
//  Created by Dato on 13.07.22.
//

import Foundation

enum Genre: CaseIterable {
    case all, comedy, action, drama
}

struct Movie {
    			
    let title: String
    let releaseDate: String
    let imdb: Double
    let mainActor: String
    var seen: Bool
    var isFavourite: Bool
    let description = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum"
    let genre: Genre
    
}

struct Movies {
    static var movieList: [Movie] =  [
        Movie(title: "gamarjoba1", releaseDate: "2020-15-16", imdb: 7.5, mainActor: "davit", seen: true, isFavourite: false, genre: .comedy),
        Movie(title: "gamarjoba2", releaseDate: "2020-15-16", imdb: 5.5, mainActor: "davit", seen: false, isFavourite: true, genre: .action),
        Movie(title: "gamarjoba3", releaseDate: "2020-15-16", imdb: 3.5, mainActor: "davit", seen: false, isFavourite: false, genre: .drama),
        Movie(title: "gamarjoba4", releaseDate: "2020-15-16", imdb: 8.5, mainActor: "davit", seen: true, isFavourite: true, genre: .comedy),
        Movie(title: "gamarjoba5", releaseDate: "2020-15-16", imdb: 4.5, mainActor: "davit", seen: false, isFavourite: false, genre: .action),
        Movie(title: "gamarjoba6", releaseDate: "2020-15-16", imdb: 6.5, mainActor: "davit", seen: false, isFavourite: true, genre: .drama),
        Movie(title: "gamarjoba7", releaseDate: "2020-15-16", imdb: 7.0, mainActor: "davit", seen: false, isFavourite: false, genre: .comedy),
        Movie(title: "gamarjoba8", releaseDate: "2020-15-16", imdb: 9, mainActor: "davit", seen: false, isFavourite: false, genre: .drama),
        Movie(title: "gamarjoba9", releaseDate: "2020-15-16", imdb: 5.5, mainActor: "davit", seen: true, isFavourite: false, genre: .action),
        Movie(title: "gamarjoba10", releaseDate: "2020-15-16", imdb: 8, mainActor: "davit", seen: false, isFavourite: false, genre: .drama)
    ]
    
    
    
    static func update(movie: Movie) {
        guard let movieIndex = Movies.movieList.firstIndex(where: {$0.title == movie.title}) else {return}
        Movies.movieList[movieIndex] = movie
    }
    
}










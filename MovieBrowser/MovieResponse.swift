//
//  MovieSearchResults.swift
//  SamLoBueMockInterview
//
//  Created by Marc-Developer on 10/23/22.
//

import Foundation

struct MovieResponse: Decodable {
    let results: [Movie]
}

struct Movie: Decodable {
    let title: String?
    let releaseDate: String?
    let voteAverage: Double?
    let overview: String?
    let posterPath: String?
    let id: Int?
    
    private enum CodingKeys: String, CodingKey {
        case title = "title"
        case voteAverage = "vote_average"
        case releaseDate = "release_date"
        case overview = "overview"
        case posterPath = "poster_path"
        case id = "id"
    }
}

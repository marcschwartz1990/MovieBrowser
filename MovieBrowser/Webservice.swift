//
//  Webservice.swift
//  SamLoBueMockInterview
//
//  Created by Marc-Developer on 10/23/22.
//

import Foundation
import SwiftUI

enum NetworkError: Error {
    case badURL
    // TODO: Incorporate response catch in URLSession call
    case badID
}

class Webservice {
    // Provides functionality relating to networking
    func getMovies(searchTerm: String) async throws -> [Movie] {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.themoviedb.org"
        components.path = "/3/search/movie"
        components.queryItems = [
        URLQueryItem(name: "api_key", value: "f1bba69d2f7b8e57f3db0f3c5cf16c9a"),
        URLQueryItem(name: "query", value: searchTerm)
        ]
        
        guard let url = components.url else {
            print("Invalid URL")
            throw NetworkError.badURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            throw NetworkError.badID
        }
        
        let movieResponse = try? JSONDecoder().decode(MovieResponse.self, from: data)
        
        // If movieResponse has a value, then access results. Otherwise, return an empty array (optional chaining)
        return movieResponse?.results ?? []
    }
    
    func getImageURL(posterURL: String, width: Int) throws -> URL {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "image.tmdb.org"
        components.path = "t/p/" + "w" + "\(width)" + posterURL

        guard let url = components.url else {
            print("Invalid URL")
            throw NetworkError.badURL
        }
        return url
    }
}

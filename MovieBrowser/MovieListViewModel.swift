//
//  MovieListViewModel.swift
//  SamLoBueMockInterview
//
//  Created by Marc-Developer on 10/23/22.
//

import Foundation

@MainActor
class MovieListViewModel: ObservableObject {
    @Published var movies: [MovieViewModel] = []
    
    func search(name: String) async {
        do {
            let movies = try await Webservice().getMovies(searchTerm: name)
            self.movies = movies.map(MovieViewModel.init)
        } catch {
            print(error)
        }
    }
}

struct MovieViewModel: Identifiable {
    
    let movie: Movie
    
    var title: String {
        movie.title ?? "Unknown title"
    }
    
    var id: Int {
        movie.id ?? -1
    }
    
    var voteAverage: String {
        let avg = movie.voteAverage ?? -1.0
        if movie.voteAverage == 0.0 || avg == -1.0 {
            return "N/A"
        }
        return String(format: "%.1f", avg)
    }
    
    var releaseDate: Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-mm-dd"
        
        let date = dateFormatter.date(from: movie.releaseDate ?? "0000-00-00")
        return date
    }
    
    var overview: String {
        movie.overview ?? "No overview"
    }
    
    var posterPath: URL? {
        let path = movie.posterPath ?? "badpath.jpg"
        let url = URL(string: "https://image.tmdb.org/t/p/w500\(path)")
        return url
    }
}

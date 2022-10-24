//
//  MovieDetailView.swift
//  SamLoBueMockInterview
//
//  Created by Marc-Developer on 10/23/22.
//

import SwiftUI

struct MovieDetailView: View {
    let movie: MovieViewModel
    @ObservedObject var movieListVM = MovieListViewModel()
    
    var body: some View {
        VStack {
            Text(movie.title)
                .font(.system(size: 26.0))
                .multilineTextAlignment(.center)
                .padding()
            
            Text("Release Date: \(movie.releaseDate?.monthDayYearDigitsOnlyString ?? "Unknown")")
                .font(.caption)
                .foregroundColor(.secondary)
                .padding(.bottom)
            
            GeometryReader { geometry in
                HStack {
                    VStack {
                        AsyncImage(url: movie.posterPath) { image in
                            image
                                .resizable()
                                .scaledToFit()
                                .frame(width: geometry.size.width * 0.50)
                        } placeholder: {
                            ProgressView()
                                .frame(width: geometry.size.width * 0.50)
                        }
                        
                        Spacer()
                    }
                    ScrollView {
                        Text(movie.overview)
                            .frame(width: geometry.size.width * 0.50)
                    }
                }
                .fixedSize(horizontal: true, vertical: false)
            }
            .padding()
            
            Spacer()
        }
    }
}

//struct MovieDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        MovieDetailView(movie: movie)
//    }
//}

//
//  ContentView.swift
//  SamLoBueMockInterview
//
//  Created by Marc-Developer on 10/23/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var movieListVM = MovieListViewModel()
    @State private var searchTerm = ""
    
    var body: some View {
        NavigationView {
            List {
                ForEach(movieListVM.movies) { movie in
                    NavigationLink {
                        MovieDetailView(movie: movie)
                    } label: {
                        MovieTitleView(movie: movie)
                    }
                }
            }
            .searchable(text: $searchTerm,
                        placement: .navigationBarDrawer(displayMode: .always)
            )
            .onSubmit(of: .search) {
                Task {
                    await movieListVM.search(name: searchTerm)
                }
            }
            .navigationTitle("Movie Search")
            .navigationBarTitleDisplayMode(.inline)
            .listStyle(.inset)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

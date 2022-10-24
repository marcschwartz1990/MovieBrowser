//
//  ContentView.swift
//  SamLoBueMockInterview
//
//  Created by Marc-Developer on 10/23/22.
//

import SwiftUI

// MARK: - Get an API Key from MovieDB

// TODO: Create Search bar with "go" button

// TODO: Create Main View (scrollable list of search results where each listing is a button to a detail view)

// TODO: Detail View must contain a placeholder image.





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

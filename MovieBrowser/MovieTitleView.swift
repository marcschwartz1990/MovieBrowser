//
//  MovieTitleView.swift
//  SamLoBueMockInterview
//
//  Created by Marc-Developer on 10/23/22.
//

import SwiftUI

struct MovieTitleView: View {
    let movie: MovieViewModel
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(movie.title)
                    .font(.system(size: 22.0))
                    .padding(.bottom)
                
                Text(movie.releaseDate?.monthDayYearString ?? "")
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            
            Spacer()
            
            VStack(alignment: .trailing) {
                Text(String(format: "%.1f", movie.voteAverage))
            }
        }
    }
}

//struct MovieTitleView_Previews: PreviewProvider {
//    static var previews: some View {
//        MovieTitleView()
//    }
//}

//
//  MovieListScreen.swift
//  UseSwiftUIInUIKit
//
//  Created by paige on 2022/04/08.
//

import SwiftUI

struct MovieListScreen: View {
    var body: some View {
        NavigationView {
            List(1...20, id: \.self) { index in
                
                NavigationLink(destination: MovieDetails(name: "Movie \(index)").navigationTitle("Movie \(index)")) {
                    HStack {
                        Text("Movie \(index)")
                        Spacer()
                        RatingsView(rating: .constant(Int.random(in: 1...5)))
                    }
                }

            }
        }
    }
}

struct MovieListScreen_Previews: PreviewProvider {
    static var previews: some View {
        MovieListScreen()
    }
}

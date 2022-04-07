//
//  CoreDataCrudView.swift
//  SwiftuILists
//
//  Created by paige on 2022/04/08.
//

import SwiftUI

struct CoreDataCrudView: View {
    let coreDM: CoreDataManager
    @State private var movieName: String = ""
    @State private var movies: [MyMovie] = [MyMovie]()
    @State private var needsRefresh: Bool = false
    
    private func populateMovies() {
        movies = coreDM.getAllMovies()
        print(movies[0].title!)
    }
    
    var body: some View {
        NavigationView {
        VStack {
            TextField("Enter movie name", text: $movieName)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            Button("Save") {
                coreDM.saveMovie(title: movieName)
                populateMovies()
            }
            
            List {
                ForEach(movies, id: \.self) { movie in
                    NavigationLink(
                        destination: MovieDetail(movie: movie, needsRefresh: $needsRefresh, coreDM: coreDM),
                        label: {
                            Text(movie.title ?? "")
                        })
                }.onDelete(perform: { indexSet in
                    indexSet.forEach { index in
                        let movie = movies[index]
                        coreDM.deleteMovie(movie: movie)
                        populateMovies()
                    }
                })
            }
            .listStyle(PlainListStyle())
            .accentColor(needsRefresh ? .white : .black) // this triggers redraw
            
        Spacer()
        }.padding()
        .onAppear(perform: {
            populateMovies()
        })
        }
    }
}

struct CoreDataCrudView_Previews: PreviewProvider {
    static var previews: some View {
        CoreDataCrudView(coreDM: CoreDataManager())
    }
}

struct MovieDetail: View {
    
    let movie: MyMovie
    @State private var movieName: String = ""
    @Binding var needsRefresh: Bool
    let coreDM: CoreDataManager
    
    var body: some View {
        VStack {
            TextField(movie.title ?? "", text: $movieName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            Button("Update") {
                if !movieName.isEmpty {
                    movie.title = movieName
                    coreDM.updateMovie()
                    needsRefresh.toggle()
                }
                
                
            }
        }.padding()
    }
}

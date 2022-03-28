//
//  FilteringResults.swift
//  SwiftuILists
//
//  Created by paige on 2022/03/28.
//

import SwiftUI

fileprivate struct Place: Identifiable {
    let id = UUID()
    let name: String
    let photo: String
}

fileprivate func getPlaces() -> [Place] {
    return [
        Place(name: "Denver", photo: "denver"),
        Place(name: "Newyork", photo: "ny"),
        Place(name: "Costa rica", photo: "costa-rica"),
        Place(name: "Seattle", photo: "seattle"),
        Place(name: "Cuba", photo: "cuba")
    ]
}

struct FilteringResults: View {
    
    @State private var search = ""
    @State private var places = getPlaces()
    
    var body: some View {
        NavigationView {
            List(places) { place in
                HStack(alignment: .top) {
//                    Image(place.photo)
//                        .resizable()
//                        .frame(maxWidth: 100, maxHeight: 100)
//                        .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                    
                    Text(place.name)
                        .font(.title)
                }
            }
            .listStyle(.plain)
            .searchable(text: $search)
            .onChange(of: search, perform: { value in
                if !value.isEmpty && value.count >= 1 {
                    places = places.filter {
                        $0.name.lowercased().hasPrefix(value.lowercased())
                    }
                } else {
                    places = getPlaces()
                }
            })
            .navigationTitle("Places")
        }
    }
    
}

struct FilteringResults_Previews: PreviewProvider {
    static var previews: some View {
        FilteringResults()
    }
}

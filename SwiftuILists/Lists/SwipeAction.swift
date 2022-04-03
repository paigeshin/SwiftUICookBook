//
//  SwipeAction.swift
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

struct SwipeAction: View {
    
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
                .swipeActions(edge: .leading) {
                    Button {
                        
                    } label: {
                        Label("Heart", systemImage: "heart")
                    }
                    .tint(.yellow)
                }
                .swipeActions(edge: .trailing) {
                    Button {
                        
                    } label: {
                        Label("Archive", systemImage: "archivebox.circle.fill")
                    }
                    .tint(.teal)
                }
            }
            .listStyle(.plain)
            .navigationTitle("Places")
        }
    }
    
}

struct SwipeAction_Previews: PreviewProvider {
    static var previews: some View {
        SwipeAction()
    }
}

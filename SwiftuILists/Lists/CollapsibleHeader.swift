//
//  CollapsibleHeader.swift
//  SwiftuILists
//
//  Created by paige on 2022/03/28.
//

import SwiftUI

fileprivate struct Place: Identifiable {
    let id = UUID()
    let name: String
    let hikes: [Hike]
}

fileprivate struct Hike: Identifiable {
    let id = UUID()
    let name: String 
}

fileprivate func getAllPlacesWithHikes() -> [Place] {
    return [
        Place(name: "Colorado", hikes: [
            Hike(name: "Trail Ridge"),
            Hike(name: "Flatirons"),
            Hike(name: "Maroon Bells Peaks"),
        ]),
        Place(name: "Oregon", hikes: [
            Hike(name: "Cascade Moutains"),
            Hike(name: "Crater Lake National Park"),
        ])
    ]
}

struct CollapsibleHeader: View {
    
    @State private var places = getAllPlacesWithHikes()
    @State private var selectedName: String?
    @State private var expanded: Bool = false
    
    var body: some View {
        List(places) { place in
            VStack(alignment: .leading) {
                HStack {
                    Text(place.name)
                        .fontWeight(.bold)
                        .padding(.bottom, 10)
                    Spacer()
                    Image(systemName: selectedName == place.name ? "chevron.down" : "chevron.right")
                        .padding(.bottom, 10)
                }
                .onTapGesture {
                    withAnimation {
                        expanded.toggle()
                    }
                    selectedName = expanded ? place.name : nil
                }
                
                if selectedName == place.name {
                    ForEach(place.hikes) { hike in
                        Text(hike.name)
                    }
                }
            }
        }
    }
}

struct CollapsibleHeader_Previews: PreviewProvider {
    static var previews: some View {
        CollapsibleHeader()
    }
}

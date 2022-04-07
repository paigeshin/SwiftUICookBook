//
//  MapCustomAnnoatation.swift
//  SwiftuILists
//
//  Created by paige on 2022/04/08.
//

import SwiftUI
import MapKit

fileprivate struct Place: Identifiable {
    let id: String = UUID().uuidString
    let name: String
    let coordinate: CLLocationCoordinate2D
}

struct MapCustomAnnoatation: View {
    
    @State private var region: MKCoordinateRegion = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 37.808208, longitude: -122.415802),
        latitudinalMeters: 5000,
        longitudinalMeters: 5000)
    
    
    fileprivate let annotations: [Place] = [
        Place(name: "Burger Place", coordinate: CLLocationCoordinate2D(latitude: 37.807920, longitude: -122.422949)),
        Place(name: "Park", coordinate: CLLocationCoordinate2D(latitude: 37.807920, longitude: -122.422954)),
        Place(name: "Tacos", coordinate: CLLocationCoordinate2D(latitude: 37.807920, longitude: -122.422932)),
    ]
    
    var body: some View {
        Map(coordinateRegion: $region, annotationItems: annotations) { place in
            
            MapAnnotation(coordinate: place.coordinate) {
                HStack {
                    Image(systemName: "heart.fill")
                        .foregroundColor(.red)
                    Text("3")
                        .fixedSize()
                }
                .padding(10)
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 25.0, style: .continuous))
                .overlay(
                    Image(systemName: "arrowtriangle.left.fill")
                        .rotationEffect(Angle(degrees: 270))
                        .foregroundColor(.white)
                        .offset(y: 10)
                    ,alignment: .center
                )
            }
        }
    }
}

struct MapCustomAnnoatation_Previews: PreviewProvider {
    static var previews: some View {
        MapCustomAnnoatation()
    }
}

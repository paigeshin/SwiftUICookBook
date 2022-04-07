//
//  MapAnnotation.swift
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

struct MyMapAnnotation: View {
    
    @State private var region: MKCoordinateRegion = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 37.808208, longitude: -122.415802),
        latitudinalMeters: 500,
        longitudinalMeters: 500)
    
    fileprivate let annotations: [Place] = [
        Place(name: "Burger Place", coordinate: CLLocationCoordinate2D(latitude: 37.807920, longitude: -122.422949)),
        Place(name: "Park", coordinate: CLLocationCoordinate2D(latitude: 37.807920, longitude: -122.422954)),
        Place(name: "Tacos", coordinate: CLLocationCoordinate2D(latitude: 37.807920, longitude: -122.422932)),
    ]
    
    var body: some View {
        Map(
            coordinateRegion: $region,
            annotationItems: annotations) {
                MapPin(coordinate: $0.coordinate)
            }
    }
    
}

struct MapAnnotation_Previews: PreviewProvider {
    static var previews: some View {
        MyMapAnnotation()
    }
}

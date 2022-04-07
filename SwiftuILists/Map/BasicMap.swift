//
//  BasicMap.swift
//  SwiftuILists
//
//  Created by paige on 2022/04/08.
//

import SwiftUI
import MapKit

struct BasicMap: View {
    
    @State private var region: MKCoordinateRegion = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 37.808208, longitude: -122.415802),
        latitudinalMeters: 500,
        longitudinalMeters: 500)
    
    var body: some View {
        Map(coordinateRegion: $region)
    }
    
}

struct BasicMap_Previews: PreviewProvider {
    static var previews: some View {
        BasicMap()
    }
}

//
//  ChangeMap.swift
//  SwiftuILists
//
//  Created by paige on 2022/04/08.
//

import SwiftUI
import MapKit

struct ChangeMap: View {
    
    @State private var mapType: MKMapType = .standard
    
    var body: some View {
        VStack {
            
            Picker("Select", selection: $mapType) {
                Text("Standard").tag(MKMapType.standard)
                Text("Satellite").tag(MKMapType.satellite)
                Text("Hybrid").tag(MKMapType.hybrid)
            }.pickerStyle(SegmentedPickerStyle())
            
            MapView(mapType: mapType)
            
        }
    }
}

struct ChangeMap_Previews: PreviewProvider {
    static var previews: some View {
        ChangeMap()
    }
}


final class Coordinator: NSObject, MKMapViewDelegate {
    
    var control: MapView
    
    init(_ control: MapView) {
        self.control = control
    }
    
}

struct MapView: UIViewRepresentable {
    
    let mapType: MKMapType
    
    func makeUIView(context: Context) -> some MKMapView {
        let map = MKMapView()
        map.showsUserLocation = true
        map.delegate = context.coordinator
        return map
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        uiView.mapType = mapType
    }
    
}

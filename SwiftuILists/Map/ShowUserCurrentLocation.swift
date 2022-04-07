//
//  ShowUserCurrentLocation.swift
//  SwiftuILists
//
//  Created by paige on 2022/04/08.
//

import SwiftUI
import MapKit
import CoreLocation

class LocationManager: NSObject, ObservableObject {
    
    private let locationManager: CLLocationManager = CLLocationManager()
    @Published var location: CLLocation?
    private var locationFound: Bool = false
    
    override init() {
        super.init()
        
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.distanceFilter = kCLDistanceFilterNone
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingHeading()
        locationManager.delegate = self
        
    }
    
}

extension LocationManager: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if !locationFound {
            guard let location: CLLocation = locations.last else { return }
            locationFound = true
            DispatchQueue.main.async { [weak self] in
                self?.location = location
            }
        }
    }
    
}

struct ShowUserCurrentLocation: View {
    
    @StateObject private var locationManager: LocationManager = LocationManager()
    
    var newRegion: Binding<MKCoordinateRegion>? {
        guard let location = locationManager.location else {
            return MKCoordinateRegion.defaultRegion().asBindable()
        }
        let region: MKCoordinateRegion = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: 500, longitudinalMeters: 500)
        return region.asBindable()
    }
    
    var body: some View {
        if let region = newRegion {
            Map(coordinateRegion: region, interactionModes: .all, showsUserLocation: true)
        }
    }
}

struct ShowUserCurrentLocation_Previews: PreviewProvider {
    static var previews: some View {
        ShowUserCurrentLocation()
    }
}

extension MKCoordinateRegion {
    
    static func defaultRegion() -> MKCoordinateRegion {
        return MKCoordinateRegion(center:
                                    CLLocationCoordinate2D(latitude: 37.808208, longitude: -122.415802),
                                  latitudinalMeters: 500,
                                  longitudinalMeters: 500
        )
    }
    
    func asBindable() -> Binding<MKCoordinateRegion>? {
        return Binding<MKCoordinateRegion>(.constant(self))
    }
    
}

//
//  MapViewModel.swift
//  SimpleMapApp
//
//  Created by 어재선 on 7/4/24.
//

import SwiftUI
import MapKit

@Observable
class MapViewModel: NSObject, CLLocationManagerDelegate {
    var cameraPosition: MapCameraPosition = .userLocation(fallback: .automatic)
    var searchText = ""
    var mapStyle: MapStyle = .standard
    var searchResults: [MKMapItem] = []
    var selectedPlace: MKMapItem?
    var route: MKRoute?
    
    private var locaitonManager: CLLocationManager = CLLocationManager()
    
    override init() {
        super.init()
        locaitonManager.delegate = self
    }
    
    func moveToCurrentLocation() {
        cameraPosition = .userLocation(fallback: .automatic)
    }
    
    func searchLocation() {
        print("search!")
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = searchText
        request.resultTypes = .pointOfInterest
        
        let search = MKLocalSearch(request: request)
        
        search.start { [weak self] response, error in
            guard let response = response else { return }
            self?.searchResults = response.mapItems
        }
    }
    
    func getDiretion() {
        let request = MKDirections.Request()
        request.source = MKMapItem.forCurrentLocation()
        request.destination = selectedPlace!
        request.transportType = .automobile
        
        let directions = MKDirections(request: request)
        directions.calculate { [weak self] response, error in
            guard let response = response else { return }
            self?.route = response.routes.first
        }
    }
    
    func shareLocation() {
        print("share locaiton")
    }
    
    //MARK: - CLLocationManagerDelegate
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
    }
    
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: any Error) {
        print("error \(error.localizedDescription)")
    }
}

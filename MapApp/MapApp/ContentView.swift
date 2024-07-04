//
//  ContentView.swift
//  MapApp
//
//  Created by 어재선 on 7/4/24.
//

import SwiftUI
import MapKit

extension CLLocationCoordinate2D {
    static let paris = CLLocationCoordinate2D(latitude: 48.856613, longitude: 2.352222)
    static let eiffelTower = CLLocationCoordinate2D(latitude: 48.858370, longitude: 2.294481)
    static let louvre = CLLocationCoordinate2D(latitude: 48.860611, longitude: 2.337644)
    static let notreDame = CLLocationCoordinate2D(latitude: 48.852968, longitude: 2.349902)
    static let arcDeTriomphe = CLLocationCoordinate2D(latitude: 48.873792, longitude: 2.295028)
    static let sacreCoeur = CLLocationCoordinate2D(latitude: 48.886705, longitude: 2.343104)
    
}

struct IdentifiablePlace: Identifiable {
    let id: UUID
    let location: CLLocationCoordinate2D
    init(id: UUID = UUID(), lat: Double, long: Double) {
        self.id = id
        self.location = CLLocationCoordinate2D(latitude: lat, longitude: long)
        
    }
}


struct ContentView: View {
    let locationManger = CLLocationManager()
    
    @State var message = "Map of Paris"
    @State private var position: MapCameraPosition = .region(MKCoordinateRegion(center: .paris, span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)))
    @State private var region: MKCoordinateRegion = MKCoordinateRegion(center: .paris, span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
    
    let places: [(String, CLLocationCoordinate2D)] = [
        ("에펠탑", .eiffelTower),
        ("루브르 박물관", .louvre),
        ("노트르담 대성당", .notreDame),
        ("개선문", .arcDeTriomphe),
        ("사크레쾨르 대성당", .sacreCoeur)
    ]
    let place = IdentifiablePlace(lat: 48.856613, long: 2.352222)
    
    var body: some View {
        
        VStack{
            // iOS 17 이전 코드
            Map(coordinateRegion: $region,
                annotationItems: [place]) { place in
                MapMarker(coordinate: place.location,
                          tint: Color.purple)
            }
            // iOS 17 이후 코드
            Map(position: $position){
                ForEach(places, id: \.0) { place in
                    Annotation(place.0, coordinate: place.1) {
                        Image(systemName: "mappin.circle.fill")
                            .foregroundStyle(.purple)
                            .background(.white)
                            .clipShape(Circle())
                    }
                }
            }
            
            TextEditor(text:  $message)
                .frame(width: .infinity, height: 100)
        }
        .onAppear {
            locationManger.desiredAccuracy = kCLLocationAccuracyBest
            locationManger.distanceFilter = kCLDistanceFilterNone
            locationManger.requestWhenInUseAuthorization()
            locationManger.startUpdatingLocation()
        }
    }
}

#Preview {
    ContentView()
}

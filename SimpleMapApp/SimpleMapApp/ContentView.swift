//
//  ContentView.swift
//  SimpleMapApp
//
//  Created by 어재선 on 7/4/24.
//

import SwiftUI
import MapKit
import CoreLocation





struct ContentView: View {
    @State var viewModel = MapViewModel()
    @State var style = 0
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .bottom) {
                Map(position: $viewModel.cameraPosition) {
                    ForEach(viewModel.searchResults, id: \.self) {
                        place in
                        Annotation(place.name ?? "", coordinate: place.placemark.coordinate) {
                            Image(systemName: "mappin.circle.fill")
                        }
                        
                    }
                }
                .mapControls{
                    MapScaleView()
                    MapUserLocationButton()
                }
                .mapStyle(viewModel.mapStyle)
                .searchable(text: $viewModel.searchText)
                .searchScopes($style){
                    Text("Standard").tag(0)
                    Text("Imagery").tag(1)
                    Text("Hybrid").tag(2)
                }
                .onChange(of: style) {
                    switch style {
                    case 0:
                        viewModel.mapStyle = .standard
                        
                    case 1:
                        viewModel.mapStyle = .imagery
                        
                    case 2:
                        viewModel.mapStyle = .hybrid
                        
                    default:
                        viewModel.mapStyle = .standard
                    }
                }
                
            }
            
        }
        .onSubmit(of: .search) {
            viewModel.searchLocation()
        }
        
        
    }
}

#Preview {
    ContentView()
}

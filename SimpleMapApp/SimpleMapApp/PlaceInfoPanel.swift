//
//  PlaceInfoPanel.swift
//  SimpleMapApp
//
//  Created by 어재선 on 7/4/24.
//

import SwiftUI

struct PlaceInfoPanel: View {
    var viewModel: MapViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(viewModel.selectedPlace?.name ?? "Unknown Place")
                .font(.headline)
            Text(viewModel.selectedPlace?.placemark.title ?? "")
                .font(.subheadline)
            
            HStack {
                Button {
                    viewModel.getDiretion()
                } label: {
                    Label("경로", systemImage: "arrow.triangle.turn.up.right.diamond")
                }
                Spacer()
                Button {
                    viewModel.shareLocation()
                } label: {
                    Label("공유", systemImage: "square.and.arrow.up")
                }
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}

#Preview {
    PlaceInfoPanel(viewModel: MapViewModel())
}

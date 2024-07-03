//
//  ContentView.swift
//  SearchApp
//
//  Created by 어재선 on 7/3/24.
//

import SwiftUI

struct ContentView: View {
    @State private var searchText = ""
    @State private var searchScope = 0
    
    let fruits = ["Apple", "Banana", "Cherry", "Date", "Fig", "Orange"]
    let scopes = ["All", "A-M", "N-Z"]
    
    var filteredFruits: [String] {
        let filtered = fruits.filter { searchText.isEmpty || $0.localizedCaseInsensitiveContains(searchText) }
        switch searchScope {
        case 1: return filtered.filter { $0.prefix(1).localizedCaseInsensitiveCompare("N") == .orderedAscending }
        case 2: return filtered.filter { $0.prefix(1).localizedCaseInsensitiveCompare("N") != .orderedAscending }
        default: return filtered
        }
    }
    var body: some View {
        NavigationStack{
            List(filteredFruits, id: \.self) { fruit in
                Text(fruit)
            }
            .navigationTitle("Fruits")
            .searchable(text: $searchText)
            .searchScopes($searchScope) {
                ForEach(0..<scopes.count, id: \.self) { index in
                    Text(scopes[index]).tag(index)
                }
                
            }
        }
    }
}
        #Preview {
            ContentView()
        }

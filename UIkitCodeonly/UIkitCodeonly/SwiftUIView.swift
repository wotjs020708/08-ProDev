//
//  SwiftUIView.swift
//  UIkitCodeonly
//
//  Created by 어재선 on 7/8/24.
//

import SwiftUI

struct SwiftUIView: View {
    let name: String
    var body: some View {
        Text("Hello, \(name)")
            .navigationTitle("SwiftUIView")
    }
}

#Preview {
    SwiftUIView(name: "Hanna")
}

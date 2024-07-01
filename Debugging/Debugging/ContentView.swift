//
//  ContentView.swift
//  Debugging
//
//  Created by 어재선 on 7/1/24.
//

import SwiftUI

struct ContentView: View {
    @State var message = "Temperature in celsius: "
    let temp = 36.5
    
    var body: some View {
        VStack {
            Text(message + "\(temp)")
            Text("temperature in Fahrenheit: \(C2F(tempC: temp))")
        }
    }
    
    func C2F (tempC: Double) -> Double {
        var tempF: Double
        tempF = (tempC * 9/5) + 32
        return tempF
    }
}

#Preview {
    ContentView()
}

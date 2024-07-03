//
//  ContentView.swift
//  MotionApp
//
//  Created by 어재선 on 7/3/24.
//

import SwiftUI
import CoreMotion

struct ContentView: View {
    let motionManger = CMMotionManager()
    let queueq = OperationQueue()
    
    @State private var x: Double = 0.0
    @State private var y: Double = 0.0
    @State private var z: Double = 0.0
    
    var body: some View {
        VStack {
            Text("x: \(x)")
            Text("y: \(y)")
            Text("z: \(z)")
        }
        .padding()
        .onAppear {
            motionManger.startAccelerometerUpdates(to: queueq){ (data: CMAccelerometerData?, error: Error?) in
                guard let data = data else {
                    print("error: \(error)")
                    return
                }
                
                let trackMotion: CMAcceleration = data.acceleration
                motionManger.accelerometerUpdateInterval = 2.5
                DispatchQueue.main.async {
                    x = trackMotion.x
                    y = trackMotion.y
                    z = trackMotion.z
                    
                }
                
            }
        }
    }
}

#Preview {
    ContentView()
}

//
//  MagneticView.swift
//  MotionApp
//
//  Created by 어재선 on 7/3/24.
//

import SwiftUI
import CoreMotion

struct MagneticView: View {
    let motionManager = CMMotionManager()
    let queue = OperationQueue()
    
    @State private var x: Double = 0.0
    @State private var y: Double = 0.0
    @State private var z: Double = 0.0
    
    var body: some View {
        VStack {
            Text("x: \(x)")
            Text("y: \(y)")
            Text("z: \(z)")
        }
        .navigationTitle("Magnetic")
        .onAppear {
            motionManager.startMagnetometerUpdates(to: queue) {
                (data: CMMagnetometerData?, error: Error?) in
                guard let data = data else {
                    print("Error: \(error)")
                    return
                }
                let trackMtoin: CMMagneticField = data.magneticField
                motionManager.magnetometerUpdateInterval = 0.5
                DispatchQueue.main.async {
                    x = trackMtoin.x
                    y = trackMtoin.y
                    z = trackMtoin.z
                }
            }
        }
    }
}

#Preview {
    MagneticView()
}

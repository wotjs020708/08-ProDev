//
//  ContentView.swift
//  ThreadApp
//
//  Created by 어재선 on 7/1/24.
//

import SwiftUI

struct ContentView: View {
    @State var message = ""
    @State var results = ""
    @State var sliderValue = 0.0
    
    var body: some View {
        VStack {
            Button("click Me") {
                let startTime = NSDate()
                let queue = DispatchQueue.global(qos: .default)
                queue.async {
                    let fetchData = fetchSomethingFromeServer()
                    let processData = processData(fetchData)
                    
                    var firstResult: String!
                    var secondResult: String!
                    let group = DispatchGroup()
                    
                    queue.async(group: group) {
                        firstResult = calculateFirstResult(processData)
                    }
                    
                    queue.async(group: group) {
                        secondResult = calculateSecoundResult(processData)
                    }
                    
                    group.notify(queue: queue) {
                        let resultsSummary = "First: [\(firstResult!)]\nSecond: [\(secondResult!)]"
                        results = resultsSummary
                        
                        let endTime = NSDate()
                        message = "Completed in \(endTime.timeIntervalSince(startTime as Date)) seconds."
                    }
                }
            }
            TextEditor(text: $results)
            Slider(value: $sliderValue)
            Text("Message = \(message)")
            
        }
        .padding()
    }
    
    func fetchSomethingFromeServer() -> String {
        Thread.sleep(forTimeInterval: 1)
        return "Hi there"
    }
    
    func processData(_ data: String) -> String {
        Thread.sleep(forTimeInterval: 2)
        return data.uppercased()
    }
    
    func calculateFirstResult(_ data: String) -> String {
        Thread.sleep(forTimeInterval: 3)
        let message = "Number of chars: \(String(data).count)"
        return message
    }
    
    func calculateSecoundResult(_ data: String) -> String {
        Thread.sleep(forTimeInterval: 4)
        return data.replacingOccurrences(of: "E", with: "e")
    }
}

#Preview {
    ContentView()
}

//
//  ContentView.swift
//  ReadWriteApp
//
//  Created by 어재선 on 7/2/24.
//

import SwiftUI

struct ContentView: View {
    @State var createText = ""
    @State var displayText = ""
    var body: some View {
        VStack {
            TextEditor(text: $createText)
            HStack {
                Button(action:{
                    let fm = FileManager.default
                    let urls = fm.urls(for: .documentDirectory, in: .userDomainMask)
                    let url = urls.last?.appendingPathComponent("file.txt")
                    do {
                        try createText.write(to: url!, atomically: true, encoding: String.Encoding.utf8)
                    } catch {
                        print("File writing error")
                    }
                }) {
                    Text("Write File")
                }
                Button(action:{
                    let fm = FileManager.default
                    let urls = fm.urls(for: .documentDirectory, in: .userDomainMask)
                    let url = urls.last?.appendingPathComponent("file.txt")
                    do{
                        let filecontent = try String(contentsOf: url!, encoding: String.Encoding.utf8)
                        displayText = filecontent
                    } catch {
                        print("File reading error")
                    }
                    
                }) {
                    Text("Read File")
                }
            }
            TextEditor(text: $displayText)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

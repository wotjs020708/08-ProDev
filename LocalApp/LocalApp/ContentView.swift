//
//  ContentView.swift
//  LocalApp
//
//  Created by 어재선 on 7/3/24.
//

import SwiftUI

struct ContentView: View {
    @State var changeColor = false
    @State var message = ""
    
    var placeHolder: LocalizedStringKey = "placeholder-label"
    
    var body: some View {
        VStack {
            // Text, Button 는 LocalizedStringKey 를 직접 넣을 수 있다.
            Text(LocalizedStringKey("greeting-label \(message)"))
            Text("greeting-label \(message)")
            Button("button-label"){
                changeColor.toggle()
            }
            TextField(placeHolder, text: $message)
        }
        .padding()
        .background(changeColor ? Color.red : Color.yellow)
    }
}
// 언어 미리보기
#Preview("기본 - 한국어") {
    ContentView()
}
#Preview("English") {
    ContentView()
        .environment(\.locale, .init(identifier: "en"))
}
#Preview("French") {
    ContentView()
        .environment(\.locale, .init(identifier: "fr"))
}
#Preview("Spanish") {
    ContentView()
        .environment(\.locale, .init(identifier: "es"))
}

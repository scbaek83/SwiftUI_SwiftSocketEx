//
//  ContentView.swift
//  MyScoket2
//
//  Created by 백승철 on 11/15/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
        
        SendButton()
    }
}

#Preview {
    ContentView()
}

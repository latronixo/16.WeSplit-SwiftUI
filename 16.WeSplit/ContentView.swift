//
//  ContentView.swift
//  16.WeSplit
//
//  Created by Валентин on 09.05.2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            Form {
                
                Text("Hello, world!")
                Section {
                    Text("Hello, world!")
                }
                Text("Hello, world!")
                Text("Hello, world!")
            }
            .navigationTitle("SwiftUI")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    ContentView()
}

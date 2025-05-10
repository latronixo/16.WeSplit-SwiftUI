//
//  ContentView.swift
//  16.WeSplit
//
//  Created by Валентин on 09.05.2025.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
    
    let tipPercentages = [10, 15, 20, 25, 0]
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Сумма", value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        .keyboardType(.decimalPad)
                    
                    Picker("Количество гостей", selection: $numberOfPeople) {
                        ForEach(2..<100) {
                            Text("\($0) гостей")
                        }
                    }
                    .pickerStyle(.navigationLink)
                }
                Section {
                    TextField("Сумма", value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        .keyboardType(.decimalPad)
                }
            }
            .navigationTitle("Чаевые поровну")
        }
    }
}

#Preview {
    ContentView()
}

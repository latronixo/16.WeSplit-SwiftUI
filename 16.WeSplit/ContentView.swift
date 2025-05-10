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
        Form {
            Section {
                TextField("Сумма", value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                    .keyboardType(.decimalPad)
            }
            Section {
                TextField("Сумма", value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                    .keyboardType(.decimalPad)
//                TextField("Сумма", text: Binding(
//                    get: {
//                        // Преобразуем Double в строку в местной валюте
//                        checkAmount.formatted(.currency(code: Locale.current.currency?.identifier ?? "USD"))
//                    },
//                    set: { newValue in
//                        // Получаем символ местной валюты
//                        let currencySymbol = Locale.current.currencySymbol ?? "$"
//                        // Преобразуем строку обратно в Double
//                        if let value = Double(newValue.replacingOccurrences(of: currencySymbol, with: "").trimmingCharacters(in: .whitespacesAndNewlines)) {
//                            checkAmount = value
//                        }
//                    }
//                ))
//                .keyboardType(.decimalPad) // Удобная клавиатура для ввода чисел
//                TextField("Сумма", text: Binding(
//                    get: {
//                        // Преобразуем Double в строку в местной валюте
//                        checkAmount.formatted(.currency(code: Locale.current.currency?.identifier ?? "USD"))
//                    },
//                    set: { newValue in
//                        // Получаем символ местной валюты
//                        let currencySymbol = Locale.current.currencySymbol ?? "$"
//                        // Преобразуем строку обратно в Double
//                        if let value = Double(newValue.replacingOccurrences(of: currencySymbol, with: "").trimmingCharacters(in: .whitespacesAndNewlines)) {
//                            checkAmount = value
//                        }
//                    }
//                ))
//                .keyboardType(.decimalPad)
            }
        }
    }
}

#Preview {
    ContentView()
}

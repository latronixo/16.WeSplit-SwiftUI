//
//  ContentView.swift
//  16.WeSplit
//
//  Created by Валентин on 09.05.2025.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = 0.0    //сумма по чеку
    @State private var numberOfPeople = 2   //количество гостей
    @State private var tipPercentage = 20   //размер чаевых в процентах
    @FocusState private var amountIsFocused: Bool   //флаг нахождения фокуса в поле ввода суммы по чеку
    
    let tipPercentages = [10, 15, 20, 25, 0]
    
    //итого с каждого гостя
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople + 2)    //количество гостей + 2 (у нас доступ лишь к индексам массива, а они на 2 меньше, чем значения)
        let tipSelection = Double(tipPercentage)        //чаевые в процентах
        
        let tipValue = checkAmount / 100 * tipSelection //чаевые в валюте
        let grandTotal = checkAmount + tipValue         //всего со стола
        let amountPerPerson = grandTotal / peopleCount  //итого с каждого гостя
        
        return amountPerPerson
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Сумма", value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        .keyboardType(.decimalPad)  //тип клавиатуры - цифровая
                        .focused($amountIsFocused)  //когда фокус на этом текстфилде - переменная содержит true
                    
                    Picker("Количество гостей", selection: $numberOfPeople) {
                        ForEach(2..<100) {
                            Text("\($0) гостей")
                        }
                    }
                    .pickerStyle(.navigationLink)
                }
                Section("Сколько вы хотите оставить чаевых?") {
                    Picker("Процент чаевых", selection: $tipPercentage) {
                        ForEach(tipPercentages, id: \.self) {
                            Text($0, format: .percent)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                Section ("Итого с каждого гостя") {
                    Text(totalPerPerson, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                }
            }
            .navigationTitle("Чаевые поровну")
            .toolbar {  //панель кнопок в верхней части экрана (в навстеке)
                if amountIsFocused {
                    Button("Done") {
                        amountIsFocused = false
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}

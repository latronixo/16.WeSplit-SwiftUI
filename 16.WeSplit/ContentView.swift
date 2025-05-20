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
    @State private var tipPercentage = 10   //размер чаевых в процентах
    @FocusState private var amountIsFocused: Bool   //флаг нахождения фокуса в поле ввода суммы по чеку
    private var useRedBackground: Bool {
        if tipPercentage == 0 {
            return true
        } else {
            return false
        }
    }      //флаг использования красного фона в общей сумме
    
    let tipPercentages = [10, 15, 20, 25, 0]
    
    //всего со стола
    var grandTotal: Double {
        let tipSelection = Double(tipPercentage)        //чаевые в процентах
        let tipValue = checkAmount / 100 * tipSelection //чаевые в валюте
        return checkAmount + tipValue
    }
    
    //итого с каждого гостя
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople + 2)    //количество гостей + 2 (у нас доступ лишь к индексам массива, а они на 2 меньше, чем значения)
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
                        ForEach(0..<101) {
                            Text($0, format: .percent)
                        }
                    }
                    .pickerStyle(.navigationLink)
                }
                Section("Всего с чаевыми:") {
                    Text(grandTotal, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        .background(useRedBackground ? Color.red.opacity(0.3) : Color.white)
                }
                Section ("Итого:") {
                    Text("Сумма на человека")
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

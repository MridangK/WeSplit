//
//  ContentView.swift
//  WeSplit
//
//  Created by Mridang Kejriwal on 7/6/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var amount = 0.0
    @State private var people = 0
    @State private var tipPercentages = [0,5,10,15,20]
    @State private var tipPercentage = 0
    @FocusState private var amountIsFocused: Bool

    
    var totalPerPerson: Double {
        // calculate the total per person here
        let peopleCount = Double(people + 2)
        let tipSelection = Double(tipPercentage)
        let tipValue = amount / 100 * tipSelection
        let grandTotal = amount + tipValue
        let amountPerPerson = grandTotal / peopleCount
        

        return amountPerPerson
    }

    var body: some View {
        NavigationStack {
            Form {
                TextField("Enter amount",value: $amount,
                          format: .currency(code: Locale.current.currency?.identifier ?? "USD")).keyboardType(.decimalPad).focused($amountIsFocused)

                
                Section("How much tip do you want to leave"){
                    
                    Picker("Tip Percentage",selection: $tipPercentage){
                        ForEach(tipPercentages, id: \.self){
                            Text($0,format: .percent)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                TextField("Enter people",value: $people, format: .number).keyboardType(.decimalPad)
                
                Section {
                    Text(totalPerPerson, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                }

            }
        }
    }
}

#Preview {
    ContentView()
}

//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by Anfernee Viduya on 11/17/21.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var order = Order() // MARK: This is creating a new instance for the order "order = Order()"
    
    var body: some View {
        NavigationView {
            Form{
                Section {
                    Picker("Select your cake type", selection: $order.type) {
                        ForEach(0..<Order.types.count, id: \.self) {
                            Text(Order.types[$0])
                        }
                    }
                    
                    Stepper(value: $order.quantity, in: 3...20) {
                        Text("Number of cakes: \(order.quantity)")
                    }
                }
                
                Section {
                    Toggle(isOn: $order.specialRequestEnabled.animation()) {
                        Text("Any Special Request?")
                    }
                    
                    if order.specialRequestEnabled {
                        Toggle(isOn: $order.extraFrosting) {
                            Text("Add extra frosting")
                        }
                        
                        Toggle(isOn: $order.addSprinkles) {
                            Text("Add extra sprinkles")
                        }
                    }
                }
                
                Section {
                    NavigationLink(destination: AddressView(order: order)) {
                        Text("Delivery Details")
                    }
                }
            }
            .navigationBarTitle("Cupcake Corner")
        }
    }
}

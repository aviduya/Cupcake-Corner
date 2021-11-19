//
//  AddressView.swift
//  CupcakeCorner
//
//  Created by Anfernee Viduya on 11/17/21.
//

import SwiftUI

struct AddressView: View {
    @ObservedObject var order: Order //MARK: This is referencing from the created instance from prevoius instance creation

    var body: some View {
        Form {
            Section {
                TextField("Name", text: $order.name)
                TextField("Street Address", text: $order.streetAddress)
                TextField("City", text: $order.city)
                TextField("Zip", text: $order.zip)
            }
            
            Section {
                NavigationLink(destination: CheckoutView(order: order)) {
                    Text("Check Out")
                }
            }
            .disabled(order.hasValidAdress == false)
        }
        .navigationBarTitle("Delivery Details", displayMode: .inline)
    }
}

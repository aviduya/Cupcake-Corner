//
//  CheckoutViewModel.swift
//  CupcakeCorner
//
//  Created by Anfernee Viduya on 11/18/21.
//

import Foundation
import SwiftUI

class CheckoutViewModel {
    
    @ObservedObject var order: Order
    
    func placeOrder() {
        guard let encoded = try? JSONEncoder().encode(order)
        else {
            print("Failed to encode order.")
            return
        }
        
        let url = URL(string: "https://reqres.in/api/cupcakes")!
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        request.httpBody = encoded
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                print("No data in response: \(error?.localizedDescription ?? "Unknown Error").")
                return
            }
            
            if let decodedOrder = try? JSONDecoder().decode(Order.self, from: data) {
                let confirmMessage = "Your Order for \(decodedOrder.quantity)x \(Order.types[decodedOrder.type].lowercased()) cupcakes is on its way "
                let showingMessage  = true
            } else {
                print("Invalid response from server")
            }
        }.resume()
    }
    
}

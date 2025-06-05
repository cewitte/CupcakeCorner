//
//  CheckoutView.swift
//  CupcakeCorner
//
//  Created by Carlos Eduardo Witte on 24/02/25.
//

import SwiftUI

struct CheckoutView: View {
    var order: Order
    
    @State private var confirmationMessage = ""
    @State private var showConfirmation = false
    
    @State private var networkErrorMessage = ""
    @State private var showNetworkError = false
    
    var body: some View {
        ScrollView {
            VStack {
                AsyncImage(url: URL(string: "https://hws.dev/img/cupcakes@3x.jpg"), scale: 3) { image in
                    image
                        .resizable()
                        .scaledToFit()
                } placeholder: {
                    ProgressView()
                }
                .frame(height: 233)
                
                Text("Your total cost is \(order.cost, format: .currency(code: "USD"))")
                    .font(.title)
                
                Button("Place Order") {
                    Task {
                        await placeOrder()
                    }
                }
                .padding()
            }
        }
        .navigationTitle("Checkout")
        .navigationBarTitleDisplayMode(.inline)
        .scrollBounceBehavior(.basedOnSize)
        .alert("Thank you!", isPresented: $showConfirmation) {
            Button("OK") {}
        } message: {
            Text(confirmationMessage)
        }
        .alert("Oops!", isPresented: $showNetworkError) {
            Button("OK") {}
        } message: {
            Text(networkErrorMessage)
        }
    }
    
    func placeOrder() async {
        guard let encoded = try? JSONEncoder().encode(order) else {
            print("Failed to encode order")
            return
        }
        
        let url = URL(string: "https://reqres.in/api/cupcakes")!
        var request = URLRequest(url: url)
        request.setValue( "application/json", forHTTPHeaderField: "Content-Type")
        
        // introducing a bug to get the network error message below
//        request.httpMethod = "POST"
        
        do {
            let (data, _) = try await URLSession.shared.upload(for: request, from: encoded)
            
            // handle our result
            let decodedOrder = try JSONDecoder().decode(Order.self, from: data)
            confirmationMessage = "Your order for \(decodedOrder.quantity) x \(Order.types[decodedOrder.type].lowercased()) is on its way!"
            showConfirmation = true
        } catch {
            print("Check out failed: \(error.localizedDescription)")
            networkErrorMessage = "A network error occurred. Please try again later."
            showNetworkError = true
        }
    }
}

#Preview {
    CheckoutView(order: Order())
}

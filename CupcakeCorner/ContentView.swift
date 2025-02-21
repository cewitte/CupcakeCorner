//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by Carlos Eduardo Witte on 13/02/25.
//

import SwiftUI


struct ContentView: View {
   @State private var counter = 0

    var body: some View {
        Button("Counter \(counter)") {
            counter += 1
        }
        .sensoryFeedback(.increase, trigger: counter)
    }
        
   
}

#Preview {
    ContentView()
}

//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by Carlos Eduardo Witte on 13/02/25.
//

import SwiftUI

struct ContentView: View {
    @State private var username = ""
    @State private var email = ""

    var body: some View {
        var disabledForm: Bool {
            username.count < 5 || email.count < 5
        }
        
        Form {
            Section {
                TextField("Username", text: $username)
                TextField("Email", text: $email)
                
                Section {
                    Button("Create account") {
                        print("Creating account")
                    }
                }
                .disabled(disabledForm)
                
            }
        }
        
        
    }
}

#Preview {
    ContentView()
}

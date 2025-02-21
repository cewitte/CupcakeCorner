//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by Carlos Eduardo Witte on 13/02/25.
//

import SwiftUI

@Observable
class User: Codable {
    
    enum CodingKeys: String, CodingKey {
        case _name = "name"
    }
    
    var name = "Taylor"
}

struct ContentView: View {
   

    var body: some View {
        Button("Encode Taylor", action: encodeTaylor)
        
        
    }
    
    func encodeTaylor() {
        let data = try! JSONEncoder().encode(User())
        let str = String(decoding: data, as: UTF8.self)
        print(str)
    }
}

#Preview {
    ContentView()
}

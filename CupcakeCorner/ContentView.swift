//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by Carlos Eduardo Witte on 13/02/25.
//

import SwiftUI

struct Response: Codable {
    var results: [Result]
}

struct Result: Codable {
    var trackId: Int
    var trackName: String
    var collectionName: String
}

struct ContentView: View {
    
    @State private var results = [Result]()
    
    var body: some View {
        
        AsyncImage(url: URL(string: "https://picsum.photos/200/300")!) { phase in
            if let image = phase.image {
                image
                    .resizable()
                    .scaledToFit()
            } else if phase.error != nil {
                Text("There was an error loading the image")
            } else {
                ProgressView()
            }
        }
        .frame(width: 200, height: 300)
        
    }
}

#Preview {
    ContentView()
}

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
        
        List(results, id: \.trackId) { item in
            VStack(alignment: .leading) {
                Text(item.trackName)
                    .font(.headline)
                Text(item.collectionName)
                    .font(.caption)
            }
        }
        .task {
            await loadData()
        }
        
    }
    
    func loadData() async {
        // 1. Get URL from Apple's iTunes service
        guard let url = URL(string: "https://itunes.apple.com/search?term=taylor+swift&entity=song") else {
            print("Invalid URL")
            return
        }
        
        do {
            // 2. Get data from URL
            let (data, _) = try await URLSession.shared.data(from: url)
            // more code to come
            
            // 3. Parse received data into results
            if let decodedResponse = try? JSONDecoder().decode(Response.self, from: data) {
                results = decodedResponse.results
            }
            
        } catch {
            print("Invalid data: \(error)")
        }
    }
}

#Preview {
    ContentView()
}

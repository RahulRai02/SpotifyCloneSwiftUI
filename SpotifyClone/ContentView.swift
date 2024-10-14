//
//  ContentView.swift
//  SpotifyClone
//
//  Created by Rahul Rai on 10/10/24.
//

import SwiftUI

struct ContentView: View {
    @State private var users: [User] = []
    @State private var products: [Product] = []
    var body: some View {
        ScrollView{
            VStack{
                ForEach(products){ product in
                    Text(product.title)
                }
            }
        }
        .padding()
        .task{
            await getData()
        }
    }
    
    private func getData() async{
        do{
            users = try await DatabaseHelper().getUsers()
            products = try await DatabaseHelper().getProducts()
        }catch{
            
        }
    }
}

#Preview {
    ContentView()
}

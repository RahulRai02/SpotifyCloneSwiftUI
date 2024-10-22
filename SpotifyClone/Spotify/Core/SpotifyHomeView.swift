//
//  SpotifyHomeView.swift
//  SpotifyClone
//
//  Created by Rahul Rai on 14/10/24.
//

import SwiftUI

struct SpotifyHomeView: View {
    
    @State private var currentUser: User? = nil
    @State private var selectedCateogry: Category? = nil
    @State private var products : [Product] = []
    var body: some View {
        ZStack{
//            Color.red.ignoresSafeArea()
            Color.spotifyBlack.ignoresSafeArea()
//            header
            ScrollView(.vertical) {
                LazyVStack(spacing: 2,
                           pinnedViews: [.sectionHeaders],
                           content: {
                    Section {
                        VStack(spacing: 16){
                            recentSection
                            if let product = products.first{
                                newReleaseSection(product: product)
                            }
                        }
                        .padding(.horizontal, 16)
//                        ForEach(0..<20) { _ in
//                            Rectangle()
//                                .fill(Color.red)
//                                .frame(width: 200, height: 200)
//                        }
                    } header: {
                        header
                    }
                })
                .padding(.top, 8)
            }
            .scrollIndicators(.hidden)
            .clipped()
        }
        .task{
            await getData()
        }
        .toolbar(.hidden, for: .navigationBar)
    }
    
    private var recentSection: some View{
        LazyVGrid(columns: [GridItem(.flexible(minimum: 20)), GridItem(.flexible(minimum: 20))], content: {
            ForEach(products) { product in
                SpotifyRecentsCell(imageName: product.firstImage,
                                   title: product.title)
            }
        })
    }
    
    private func newReleaseSection(product: Product) -> some View{
        SpotifyNewReleaseCell(
            imageName: product.firstImage,
            headline: product.brand,
            subheadline: product.warrantyInformation,
            title: product.title,
            subtitle: product.shippingInformation,
            onAddToPlaylistPressed: {
                
            },
            onPlayPressed: {
                
            }
        )
    }
    
    private func getData() async{
        do{
            currentUser = try await DatabaseHelper().getUsers().last
            products = try await Array(DatabaseHelper().getProducts().prefix(8))
        }catch{
            
        }
    }

    private var header: some View {
        HStack(spacing:0){
            ZStack{
                if let currentUser {
                    ImageLoaderView(urlString: currentUser.image)
                        .background(.spotifyWhite)
                        .clipShape(Circle())
                        .onTapGesture {
                            // Go to Profile Screen
                        }
                }
            }
            .frame(width: 35, height: 35)

            ScrollView(.horizontal) {
                HStack(spacing: 8){
                    ForEach(Category.allCases, id: \.self){category in
                        // Enum or struct
                        // if i know all the categories at compile time them we will use enum otherwise struct(if we are doing some fetch requests and all)
                        SpotifyCategoryCell(title: category.rawValue.capitalized,
                                            isSelected: category == selectedCateogry)
                        .onTapGesture {
                            selectedCateogry = category
                        }
                    }
                }
                .padding(.horizontal, 16)
            }
            .scrollIndicators(.hidden)
           
        }
        .padding(.vertical, 24)
        .padding(.leading, 8)
        .background(Color.spotifyBlack)
    }
    
}

#Preview {
    SpotifyHomeView()
}

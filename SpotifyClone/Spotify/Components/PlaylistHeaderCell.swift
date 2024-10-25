//
//  PlaylistHeaderCell.swift
//  SpotifyClone
//
//  Created by Rahul Rai on 25/10/24.
//

import SwiftUI

struct PlaylistHeaderCell: View {
    var title: String = "Some playlist title goes here"
    var subtitle: String = "Subtitle goes here"
    var imageName: String = Constants.randomImage
    var shadowColor: Color = .spotifyBlack.opacity(0.8)
    
    var body: some View {
  
            Rectangle()
                .opacity(0)
                .overlay(
                    ImageLoaderView(urlString: imageName)
                )
                
                .overlay(alignment: .bottomLeading,
                         content: {
                    VStack(alignment:.leading, spacing: 8){
                        Text(subtitle)
                            .font(.headline)
                        Text(title)
                            .font(.largeTitle)
                            .fontWeight(.bold)
                    }
                    .foregroundStyle(.spotifyWhite)
                    .padding(16)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(
                        LinearGradient(
                            colors: [
                                shadowColor.opacity(0),
                                shadowColor
                            ],
                            startPoint: .top,
                            endPoint: .bottom
                        )
                    )
                })
                .stretchyHeader(height: 300)

    }
}

#Preview {
    ZStack{
        Color.black.ignoresSafeArea()
        
        ScrollView{
            PlaylistHeaderCell()
        }
        .ignoresSafeArea()
        
    }
    
}

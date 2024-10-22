//
//  SpotifyNewReleaseCell.swift
//  SpotifyClone
//
//  Created by Rahul Rai on 22/10/24.
//

import SwiftUI

struct SpotifyNewReleaseCell: View {
    var imageName: String = Constants.randomImage
    var headline: String? = "New Release from"
    var subheadline: String? = "Some Artist"
    var title: String? = "Some Playlist"
    var subtitle: String? = "Single - title"
    
    // actions
    var onAddToPlaylistPressed: (() -> Void)? = nil
    var onPlayPressed: (() -> Void)? = nil
    
    var body: some View {
        VStack(spacing: 16){
            HStack(spacing: 8){
                ImageLoaderView(urlString: imageName)
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                VStack(alignment: .leading, spacing: 2){
                    if let headline = headline {
                        Text(headline)
                            .foregroundStyle(.spotifyLightGrey)
                            .font(.callout)
                    }
                    
                    if let subheadline = subheadline {
                        Text(subheadline)
                            .font(.title2)
                            .fontWeight(.medium)
                            .foregroundStyle(.spotifyWhite)
                    }
                }
//                .background(Color.red)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
//            .background(Color.blue)
            HStack{
                ImageLoaderView(urlString: imageName)
                    .frame(width: 140, height: 140)
                
                VStack(alignment: .leading, spacing: 32) {
                    VStack(alignment: .leading, spacing: 2){
                        if let title = title {
                            Text(title)
                                .foregroundStyle(.spotifyWhite)
                                .fontWeight(.semibold)
                                .font(.callout)
                        }
                        if let subtitle = subtitle {
                            Text(subtitle)
                                .foregroundStyle(.spotifyLightGrey)
                                .font(.callout)
                        }
                    }
                    HStack(spacing:0){
                        Image(systemName: "plus.circle")
                            .foregroundStyle(.spotifyLightGrey)
                            .font(.title3)
                            .padding(4)
//                            .background(Color.pink)
                            .background(Color.black.opacity(0.001))
                            .onTapGesture {
                                onAddToPlaylistPressed?()   //Optional chaining
                            }
                            .offset(x: -4)
                            .frame(maxWidth: .infinity, alignment: .leading)
//                            .background(Color.red)
                        Image(systemName: "play.circle.fill")
                            .foregroundStyle(.spotifyWhite)
                            .font(.title)
                            
                    }
                }
                .padding(.trailing, 16)
            }
//            .background(Color.blue)
            .themeColors(isSelected: false)
            .cornerRadius(8)
            .onTapGesture {
                onPlayPressed?()
            }
        }
    }
}

#Preview {
    ZStack{
        Color.black.ignoresSafeArea()
        SpotifyNewReleaseCell()
            .padding()
    }
    
    
}

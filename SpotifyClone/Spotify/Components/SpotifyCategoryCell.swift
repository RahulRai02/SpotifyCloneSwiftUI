//
//  SpotifyCategoryCell.swift
//  SpotifyClone
//
//  Created by Rahul Rai on 14/10/24.
//

import SwiftUI

struct SpotifyCategoryCell: View {
    var title: String = "Music"
    var isSelected: Bool = false
    var body: some View {
        Text(title)
            .font(.callout)
            .frame(minWidth: 35)
            .padding(.vertical, 8)
            .padding(.horizontal, 10)
            .themeColors(isSelected: isSelected)
//            .background(isSelected ? .spotifyGreen : .spotifyDarkGrey)
//            .foregroundStyle(isSelected ? .spotifyBlack : .spotifyWhite)
            .cornerRadius(16)
    }
}

extension View {
    func themeColors(isSelected: Bool) -> some View {
        self
            .background(isSelected ? .spotifyGreen : .spotifyDarkGrey)
            .foregroundStyle(isSelected ? .spotifyBlack : .spotifyWhite)
    }
}


#Preview {
    ZStack{
        Color.black.ignoresSafeArea()
        VStack(spacing: 40){
            SpotifyCategoryCell(title: "Title goes here")
            SpotifyCategoryCell(title: "Title goes here", isSelected: true)
            SpotifyCategoryCell(isSelected: false)
        }
       
    }
    
}

//
//  SpotifyRecentsCell.swift
//  SpotifyClone
//
//  Created by Rahul Rai on 15/10/24.
//

import SwiftUI

struct SpotifyRecentsCell: View {
    var imageName: String = Constants.randomImage
    var title: String = "Some random title"
    var body: some View {
        HStack(spacing: 16){
            ImageLoaderView(urlString: imageName)
                .frame(width: 55, height: 55)
            Text(title)
                .font(.callout)
                .fontWeight(.semibold)
                .lineLimit(2)
//                .background(Color.green)
        }
//        .foregroundStyle(Color.red)
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.trailing, 8)
        .themeColors(isSelected: false)
//        .background(Color.blue)
        .cornerRadius(6)
    }
}

#Preview {
    
    ZStack{
        Color.black.ignoresSafeArea()
        VStack{
            HStack{
                SpotifyRecentsCell()
                SpotifyRecentsCell()
            }
            HStack{
                SpotifyRecentsCell()
                SpotifyRecentsCell()
            }
        }
    }
//    SpotifyRecentsCell()
}

//
//  ImageTitleRowCell.swift
//  SpotifyClone
//
//  Created by Rahul Rai on 23/10/24.
//

import SwiftUI

struct ImageTitleRowCell: View {
    var imageSize: CGFloat = 100
    var imageName: String = Constants.randomImage
    var title: String = "Some Item Name"
        
    var body: some View {
        VStack(alignment: .leading, spacing: 8){
            ImageLoaderView(urlString: imageName)
                .frame(width: imageSize,
                       height: imageSize)
            Text(title)
                .font(.callout)
                .foregroundStyle(.spotifyLightGrey)
                .lineLimit(2)
                .padding(4)
        }
        .frame(width: imageSize)
//        .background(Color.red)
    }
}

#Preview {
    ZStack{
        Color.black.ignoresSafeArea()
        ImageTitleRowCell()
    }
//    ImageTitleRowCell()
}

//
//  StretchyHeaderModifier.swift
//  SpotifyClone
//
//  Created by Rahul Rai on 26/10/24.
//

import SwiftUI

/// 1. Make the header image fixed to the top, that we handled using the offset
/// 2. While scrolling down if geo changes change the frame height to offset + height... to create a stretched effect

struct StretchyHeaderModifier: ViewModifier {
    var height: CGFloat
    
    func body(content: Content) -> some View {
        GeometryReader { geo in
            let global = geo.frame(in: .global)
            
            content
                .offset(y: global.minY > 0 ? -global.minY : 0)
                .frame(height: global.minY > 0 ? height + global.minY : height)
        }
    }
}


extension View {
    func stretchyHeader(height: CGFloat) -> some View {
        self
            .modifier(StretchyHeaderModifier(height: height))
    }
}

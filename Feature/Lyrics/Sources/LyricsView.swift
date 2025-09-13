//
//  LyricsView.swift
//  FeatureB
//
//  Created by Jung Hwan Park on 9/7/25.
//

import SwiftUI

public struct LyricsView: View {
    public init() {}
    
    public var body: some View {
        VStack {
            Text("Hello, this is Lyrics!!!")
            
            Image("generic_image_b", bundle: .module)
        }
    }
}

#Preview {
    LyricsView()
}

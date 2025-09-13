//
//  ShazamView.swift
//  FeatureA
//
//  Created by Jung Hwan Park on 9/7/25.
//

import SwiftUI

public struct ShazamView: View {
    public init() {}
    
    public var body: some View {
        VStack {
            Text("Hello, this is ShazamView")
            
            Image("generic_image_a", bundle: .module)
        }
    }
}

#Preview {
    ShazamView()
}

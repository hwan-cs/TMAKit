//
//  FeatureAView.swift
//  FeatureA
//
//  Created by Jung Hwan Park on 9/7/25.
//

import SwiftUI

public struct FeatureAView: View {
    public init() {}
    
    public var body: some View {
        VStack {
            Text("Hello, this is Feature A")
            
            Image("generic_image_a", bundle: .module)
        }
    }
}

#Preview {
    FeatureAView()
}

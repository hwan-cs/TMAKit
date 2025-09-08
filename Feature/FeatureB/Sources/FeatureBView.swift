//
//  FeatureBView.swift
//  FeatureB
//
//  Created by Jung Hwan Park on 9/7/25.
//

import SwiftUI

public struct FeatureBView: View {
    public init() {}
    
    public var body: some View {
        VStack {
            Text("Hello, this is Feature B!!!")
            
            Image("generic_image_b", bundle: .module)
        }
    }
}

#Preview {
    FeatureBView()
}

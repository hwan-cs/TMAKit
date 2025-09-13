//
//  SettingsView.swift
//  FeatureC
//
//  Created by Jung Hwan Park on 9/7/25.
//

import SwiftUI

public struct SettingsView: View {
    public init() {}
    
    public var body: some View {
        VStack {
            Text("Hello, this is Settings~~!")
            
            Image("generic_image_c", bundle: .module)
        }
    }
}

#Preview {
    SettingsView()
}

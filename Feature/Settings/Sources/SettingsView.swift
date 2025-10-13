//
//  SettingsView.swift
//  FeatureC
//
//  Created by Jung Hwan Park on 9/7/25.
//

import SwiftUI

public struct SettingsView: View {
    @AppStorage("isDarkMode") private var isDarkMode = false
    
    public init() {}
    
    public var body: some View {
        NavigationView {
            List {
                Section(header: Text("Appearance")) {
                    HStack {
                        Image(systemName: isDarkMode ? "moon.fill" : "sun.max.fill")
                            .foregroundColor(isDarkMode ? .purple : .orange)
                            .frame(width: 30)
                        
                        Text("Dark Mode")
                        
                        Spacer()
                        
                        Toggle("", isOn: $isDarkMode)
                            .labelsHidden()
                    }
                }
            }
        }
    }
}

#Preview {
    SettingsView()
}

//
//  SettingsView.swift
//  FeatureC
//
//  Created by Jung Hwan Park on 9/7/25.
//

import SwiftUI
import Common

public struct SettingsView: View {
    @EnvironmentObject private var themeManager: ThemeManager
    
    public init() {}
    
    public var body: some View {
        NavigationView {
            List {
                Section(header: Text("Appearance")) {
                    HStack {
                        Image(systemName: themeManager.selectedTheme == .dark ? "moon.fill" : "sun.max.fill")
                            .foregroundColor(themeManager.selectedTheme == .dark ? .purple : .orange)
                            .frame(width: 30)
                        
                        Text("Dark Mode")
                        
                        Spacer()
                        
                        Toggle("", isOn: Binding(
                            get: { themeManager.selectedTheme == .dark },
                            set: { newValue in
                                themeManager.selectedTheme = newValue ? .dark : .light
                            }
                        ))
                        .labelsHidden()
                    }
                }
            }
            .navigationTitle("Settings")
        }
    }
}

#Preview {
    SettingsView()
}

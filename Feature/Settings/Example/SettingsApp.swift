//
//  FeatureCApp.swift
//  FeatureC
//
//  Created by Jung Hwan Park on 9/7/25.
//

import Common
import SwiftUI
import Settings

@main
struct SettingsApp: App {
    @StateObject private var themeManager = ThemeManager()
            
    var body: some Scene {
        WindowGroup {
            SettingsView()
                .environmentObject(themeManager)
                .preferredColorScheme(themeManager.colorScheme)
        }
    }
}

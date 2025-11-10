//
//  ThemeManager.swift
//  Common
//
//  Created by Jung Hwan Park on 11/10/25.
//

import SwiftUI

public enum AppTheme: String, CaseIterable {
    case system, light, dark
}

final public class ThemeManager: ObservableObject {
    @AppStorage("selectedTheme") public var selectedTheme: AppTheme = .system
    
    public  var colorScheme: ColorScheme? {
        switch selectedTheme {
        case .system: return nil
        case .light: return .light
        case .dark: return .dark
        }
    }
    
    public init() { }
}

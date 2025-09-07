//
//  View+Extension.swift
//  Common
//
//  Created by Jung Hwan Park on 9/7/25.
//

import SwiftUI

public extension View {
    @ViewBuilder
    func `if`<Content: View>(_ condition: Bool, transform: (Self) -> Content) -> some View {
        if condition {
            transform(self)
        } else {
            self
        }
    }
}

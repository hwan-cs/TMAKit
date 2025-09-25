//
//  ShazamApp.swift
//  FeatureA
//
//  Created by Jung Hwan Park on 9/7/25.
//

import SwiftUI
import Shazam
import Common

@main
struct ShazamApp: App {
    @State private var shazam = ShazamService(musicState: MusicStateService())
    var body: some Scene {
        WindowGroup {
            ShazamView(service: shazam)
        }
    }
}

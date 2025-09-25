//
//  LyricsApp.swift
//  Lyrics
//
//  Created by Jung Hwan Park on 9/13/25.
//

import SwiftUI
import Lyrics
import Common

@main
struct LyricsApp: App {
    @StateObject private var musicState = MusicStateService()
    @StateObject private var lyrics = LyricsService(musicState: MusicStateService())
    
    var body: some Scene {
        WindowGroup {
            LyricsView(
                lyricsService: lyrics,
                musicState: musicState
            )
        }
    }
}

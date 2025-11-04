//
//  LyricsApp.swift
//  Lyrics
//
//  Created by Jung Hwan Park on 9/13/25.
//

import SwiftUI
import Lyrics
import Common
import Storage
import SwiftData
import StorageInterface

@main
struct LyricsApp: App {
    let modelContainer: ModelContainer
    @StateObject private var lyrics: LyricsService
    
    init() {
        let modelContainer = try! ModelContainer(for: SongEntity.self)
        self.modelContainer = modelContainer
        _lyrics = .init(wrappedValue: .init(
            musicState: MusicStateService(),
            songStorage: SwiftDataSongStorage(context: modelContainer.mainContext)
        ))
    }
    
    var body: some Scene {
        WindowGroup {
            LyricsView(
                lyricsService: lyrics,
                musicState: lyrics.musicState as! MusicStateService
            )
        }
        .modelContainer(modelContainer)
    }
}

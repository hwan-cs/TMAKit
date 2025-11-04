//
//  DependencyContainer.swift
//  TMAKit
//
//  Created by Jung Hwan Park on 9/25/25.
//

import Common
import Shazam
import Lyrics
import Storage
import Combine
import SwiftData
import CommonInterface
import ShazamInterface
import LyricsInterface
import StorageInterface

@MainActor
public class DependencyContainer: ObservableObject {
    public let modelContainer: ModelContainer
    public let musicState = MusicStateService()
    private let songStorage: SongStorage
    
    init() {
        self.modelContainer = try! ModelContainer(for: SongEntity.self)
        self.songStorage = SwiftDataSongStorage(context: modelContainer.mainContext)
    }
    
    lazy var shazamService: ShazamServiceInterface = {
        ShazamService(musicState: musicState)
    }()
    
    lazy var lyricsService: LyricsServiceInterface = {
        LyricsService(
            musicState: musicState,
            songStorage: songStorage
        )
    }()
}

//
//  DependencyContainer.swift
//  TMAKit
//
//  Created by Jung Hwan Park on 9/25/25.
//

import CommonInterface
import ShazamInterface
import LyricsInterface
import Common
import Shazam
import Lyrics
import Combine

@MainActor
public class DependencyContainer: ObservableObject {
    public let musicState = MusicStateService()
    
    lazy var shazamService: ShazamServiceInterface = {
        ShazamService(musicState: musicState)
    }()
    
    lazy var lyricsService: LyricsServiceInterface = {
        LyricsService(musicState: musicState)
    }()
}

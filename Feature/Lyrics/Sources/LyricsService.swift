//
//  LyricsService.swift
//  Lyrics
//
//  Created by Jung Hwan Park on 9/25/25.
//

import Foundation
import ShazamKit
import LyricsInterface
import CommonInterface

public class LyricsService: LyricsServiceInterface, ObservableObject {
    private let musicState: any MusicStateServiceInterface
    
    public init(musicState: any MusicStateServiceInterface) {
        self.musicState = musicState
        print("LyricsService init")
    }
    
    public func fetchLyrics(for item: SHMediaItem) -> String {
        return "\(item.artist): \(item.title)"
    }
    
    @MainActor public func getCurrentTrackLyrics() -> String? {
        guard let currentTrack = musicState.currentTrack else {
            return nil
        }
        return fetchLyrics(for: currentTrack)
    }
}

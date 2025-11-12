//
//  LyricsServiceInterface.swift
//  Lyrics
//
//  Created by Jung Hwan Park on 9/25/25.
//

import ShazamKit
import Networking

@MainActor
public protocol LyricsServiceInterface {
    func fetchLyrics(for item: SHMediaItem) async throws -> LyricResponse
    func getCurrentTrackLyrics() async throws -> LyricResponse
}

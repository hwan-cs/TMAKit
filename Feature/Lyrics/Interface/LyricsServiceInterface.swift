//
//  LyricsServiceInterface.swift
//  Lyrics
//
//  Created by Jung Hwan Park on 9/25/25.
//

import Foundation
import ShazamKit

@MainActor
public protocol LyricsServiceInterface {
    func fetchLyrics(for item: SHMediaItem) async throws -> String
    func getCurrentTrackLyrics() async throws -> String?
}

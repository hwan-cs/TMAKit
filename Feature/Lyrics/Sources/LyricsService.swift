//
//  LyricsService.swift
//  Lyrics
//
//  Created by Jung Hwan Park on 9/25/25.
//

import Moya
import ShazamKit
import Foundation
import Networking
import LyricsInterface
import CommonInterface
import StorageInterface

public class LyricsService: LyricsServiceInterface, ObservableObject {
    private let lyricsProvider = MoyaProvider<LyricsAPI>(
        plugins: [NetworkLoggerPlugin(configuration: .init(logOptions: .default))]
    )
    
    public private(set) var musicState: any MusicStateServiceInterface
    private let songStorage: SongStorage
    
    public init(
        musicState: any MusicStateServiceInterface,
        songStorage: SongStorage
    ) {
        self.musicState = musicState
        self.songStorage = songStorage
    }
    
    public func fetchLyrics(for item: SHMediaItem) async throws -> LyricResponse {
        try await withCheckedThrowingContinuation { continuation in
            lyricsProvider.request(.getLyrics(trackName: item.title, artistName: item.artist, albumName: nil)) { result in
                switch result {
                case .success(let response):
                    do {
                        let mapped = try response.map(LyricResponse.self)
                        continuation.resume(returning: mapped)
                    } catch {
                        continuation.resume(throwing: error)
                    }
                case .failure(let error):
                    continuation.resume(throwing: error)
                }
            }
        }
    }
    
    @MainActor public func getCurrentTrackLyrics() async throws -> LyricResponse {
        guard let currentTrack = musicState.currentTrack else {
            throw URLError(.badURL) // Generic error :/
        }

        return try await fetchLyrics(for: currentTrack)
    }
    
    func saveSong(_ song: SavedSong) {
        try? songStorage.saveSong(song)
    }
    
    func deleteSong(_ song: SavedSong) {
        try? songStorage.deleteSong(id: song.id)
    }
}

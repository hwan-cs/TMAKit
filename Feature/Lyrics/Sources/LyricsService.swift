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

public class LyricsService: LyricsServiceInterface, ObservableObject {
    private let lyricsProvider = MoyaProvider<LyricsAPI>(plugins: [NetworkLoggerPlugin(configuration: .init(logOptions: .default))])
    private let musicState: any MusicStateServiceInterface
    
    public init(musicState: any MusicStateServiceInterface) {
        self.musicState = musicState
    }
    
    public func fetchLyrics(for item: SHMediaItem) async throws -> LyricResponse {
        try await withCheckedThrowingContinuation { continuation in
            lyricsProvider.request(.getLyrics(trackName: item.title, artistName: item.artist, albumName: nil)) { result in
                switch result {
                case .success(let response):
                    do {
                        let mappedResponse = try response.map(LyricResponse.self)
                        continuation.resume(returning: mappedResponse)
                    } catch {
                        continuation.resume(throwing: error)
                    }
                case .failure(let error):
                    print("Error fetching lyrics: \(error)")
                    continuation.resume(throwing: error)
                }
            }
        }
    }
    
    @MainActor public func getCurrentTrackLyrics() async throws -> LyricResponse {
        guard let currentTrack = musicState.currentTrack else {
            throw URLError(.badURL) // Generic error :/
        }
        print("Fetch lyrics")
        return try await fetchLyrics(for: currentTrack)
    }
}

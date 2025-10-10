//
//  LyricsView.swift
//  FeatureB
//
//  Created by Jung Hwan Park on 9/7/25.
//

import Common
import SwiftUI
import ShazamKit

public struct LyricsView: View {
    @ObservedObject private var lyricsService: LyricsService
    @ObservedObject private var musicState: MusicStateService
    
    @State private var lyrics: String = ""
    @State private var isLoading = false
    
    public init(
        lyricsService: LyricsService,
        musicState: MusicStateService
    ) {
        self.lyricsService = lyricsService
        self.musicState = musicState
    }
    
    public var body: some View {
        VStack {
            if let currentTrack = musicState.currentTrack {
                Text("Now showing lyrics for: \(currentTrack.title ?? "Unknown")")
                    .font(.headline)
                
                if isLoading {
                    ProgressView("Loading lyrics...")
                } else {
                    ScrollView {
                        Text(lyrics)
                            .padding()
                    }
                }
            } else {
                Spacer()
                
                Text("No track selected")
                    .foregroundColor(.secondary)
                
                Spacer()
            }
        }
        .onReceive(musicState.currentTrackPublisher) { track in
            if track.shazamID != musicState.currentTrack?.shazamID {
                loadLyrics()
            }
        }
    }
    
    private func loadLyrics() {
        Task {
            do {
                let lyricsResponse = try await lyricsService.getCurrentTrackLyrics()
                let plainLyrics = lyricsResponse.first?.plainLyrics
                lyrics = plainLyrics ?? ""
            } catch {
                lyrics = "Cannot get lyrics for current track"
            }
        }
    }
}

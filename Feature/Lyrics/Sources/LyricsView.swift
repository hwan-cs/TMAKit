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

    @State private var loadingState: LoadingState = .idle
    
    private enum LoadingState {
        case idle
        case loading
        case success
        case failure
    }
    
    public init(
        lyricsService: LyricsService,
        musicState: MusicStateService
    ) {
        self.lyricsService = lyricsService
        self.musicState = musicState
    }
    
    public var body: some View {
        NavigationView {
            VStack {
                if let currentTrack = musicState.currentTrack {
                    artistHeader(currentTrack: currentTrack)
                    
                    Divider()
                    
                    contentView
                } else {
                    emptyStateView
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("\(musicState.currentTrack?.title ?? "Lyrics")")
            .onAppear {
                if musicState.currentTrack != nil && loadingState == .idle {
                    loadLyrics()
                }
            }
            .onReceive(musicState.currentTrackPublisher) { track in
                if track.shazamID != musicState.currentTrack?.shazamID {
                    loadLyrics()
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink {
                        Text("History")
                    } label: {
                        Image(systemName: "scroll.fill")
                            .foregroundStyle(Color.green.gradient)
                    }
                }
            }
        }
    }
    
    @ViewBuilder
    private var contentView: some View {
        switch loadingState {
        case .idle:
            EmptyView()
        case .loading:
            Spacer()
            ProgressView("Loading lyrics...")
            Spacer()
        case .success:
            ScrollView {
                Text(lyrics)
                    .multilineTextAlignment(.leading)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
            }
            .textSelection(.enabled)
        case .failure:
            failureView
        }
    }
    
    private func artistHeader(currentTrack: SHMediaItem) -> some View {
        Text("\(currentTrack.artist ?? "Unknown Artist")")
            .frame(maxWidth: .infinity, alignment: .center)
            .font(.title3.weight(.medium))
            .padding(.horizontal)
    }
    
    private var emptyStateView: some View {
        VStack {
            Spacer()
            Text("No track selected")
                .foregroundColor(.secondary)
            Spacer()
        }
    }
    
    private var failureView: some View {
        ContentUnavailableView {
            Text("Failed to get lyrics for current track")
                .foregroundStyle(.black)
                .font(.headline.weight(.medium))
        } description: {
            Text("Please check your internet connection and try again.")
                .foregroundStyle(.secondary)
        } actions: {
            Button("Retry") {
                loadLyrics()
            }
        }
     }
    
    private func loadLyrics() {
        guard loadingState != .loading else {
            return
        }
        
        Task {
            loadingState = .loading
            do {
                let lyricsResponse = try await lyricsService.getCurrentTrackLyrics()
                guard let plainLyrics = lyricsResponse.first?.plainLyrics, !plainLyrics.isEmpty else {
                    loadingState = .failure
                    return
                }
                lyrics = plainLyrics
                loadingState = .success
            } catch {
                loadingState = .failure
            }
        }
    }
}

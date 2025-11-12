//
//  LyricsServiceTests.swift
//  LyricsTesting
//
//  Created by Jung Hwan Park on 11/12/25.
//

import Lyrics
import Common
import Testing
import Storage
import ShazamKit
import SwiftData
import Networking
import LyricsTesting
import CommonInterface
import StorageInterface

@MainActor
struct LyricsServiceTests {
    private var service: LyricsService!
    
    init() async throws {
        let modelContainer = try! ModelContainer(for: SongEntity.self)
        service = LyricsService(
            musicState: MusicStateService(),
            songStorage: SwiftDataSongStorage(context: modelContainer.mainContext)
        )
    }

    @Test
    func testFetchLyricsSuccess() async throws {
        // Given
        let mockItem = SHMediaItem(properties: [.title: "Song", .artist: "Artist"])
        let expected: [LyricSong] = [
            .init(
                id: 1,
                name: "Song",
                trackName: "Song",
                artistName: "Artist",
                albumName: "Album",
                duration: 120,
                instrumental: false,
                plainLyrics: "Lyrics",
                syncedLyrics: nil
            )
        ]
        
        let mockProvider = LyricsServiceMock()
        mockProvider.mockResponse = expected
        
        // When
        let result = try await mockProvider.fetchLyrics(for: mockItem)
        
        // Then
        #expect(result.count == 1)
        #expect(result.first?.plainLyrics == "Lyrics")
    }
    
    @Test()
    func testFetchLyricsFailure() async throws {
        // Given
        let mockItem = SHMediaItem(properties: [.title: "Fail", .artist: "Artist"])
        let mockProvider = LyricsServiceMock()
        mockProvider.mockError = MockError.genericError
        
        // When
        // Then
        await #expect(throws: MockError.genericError) {
            _ = try await mockProvider.fetchLyrics(for: mockItem)
        }
    }
    
    @Test
    func testGetCurrentTrackLyrics() async throws {
        // Given
        let mockProvider = LyricsServiceMock()
        mockProvider.mockResponse = [
            .init(
                id: 1,
                name: "Track",
                trackName: "Track",
                artistName: "Tester",
                albumName: "Album",
                duration: 90,
                instrumental: false,
                plainLyrics: "Hello world",
                syncedLyrics: nil
            )
        ]
        
        // When
        let result = try await mockProvider.getCurrentTrackLyrics()
        
        // Then
        #expect(result.first?.artistName == "Tester")
    }
    
    @Test
    func testGetCurrentTrackLyricsNoTrack() async throws {
        await #expect(throws: URLError.self) {
            _ = try await service.getCurrentTrackLyrics()
        }
    }
}

//
//  SongStorageTests.swift
//  StorageTesting
//
//  Created by Jung Hwan Park on 11/12/25.
//

import Testing
import Storage
import SwiftData
import Foundation
import StorageTesting
import StorageInterface

@Suite struct SongStorageTests {
    var container: ModelContainer!
    var context: ModelContext!
    var storage: SwiftDataSongStorage!

    init() throws {
        container = try ModelContainer(
            for: SongEntity.self,
            configurations: ModelConfiguration(isStoredInMemoryOnly: true)
        )
        context = ModelContext(container)
        storage = SwiftDataSongStorage(context: context)
    }

    @Test func testSaveAndFetchSong() throws {
        // Given
        let song = SavedSong(
            title: "Could You Be Loved",
            artist: "Bob Marley & The Wailers",
            lyrics: "Could you be loved and be loved?",
            date: Date()
        )

        // When
        try storage.saveSong(song)
        let fetched = try storage.fetchAllSongs()

        // Then
        #expect(fetched.count == 1)
        #expect(fetched.first?.title == "Could You Be Loved")
        #expect(fetched.first?.artist == "Bob Marley & The Wailers")
    }

    @Test func testDeleteSong() throws {
        // Given
        let song = SavedSong(title: "What's Going On", artist: "Marvin Gaye", lyrics: "Oh, but who are they to judge us Simply 'cause our hair is long?")
        try storage.saveSong(song)

        // When
        try storage.deleteSong(id: song.id)
        let fetched = try storage.fetchAllSongs()

        // Then
        #expect(fetched.isEmpty)
    }

    @Test func testFetchEmptySongsInitially() throws {
        let fetched = try storage.fetchAllSongs()
        #expect(fetched.isEmpty)
    }
}

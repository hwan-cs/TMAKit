//
//  SwiftDataSongStorage.swift
//  Storage
//
//  Created by Jung Hwan Park on 11/4/25.
//

import SwiftData
import Foundation
import StorageInterface

public final class SwiftDataSongStorage: SongStorage {
    private let context: ModelContext
    
    public init(context: ModelContext) {
        self.context = context
    }
    
    public func saveSong(_ song: SavedSong) throws {
        let entity = SongEntity(
            id: song.id,
            title: song.title,
            artist: song.artist,
            lyrics: song.lyrics,
            date: song.date
        )
        context.insert(entity)
        try context.save()
    }
    
    public func fetchAllSongs() throws -> [SavedSong] {
        let descriptor = FetchDescriptor<SongEntity>(sortBy: [SortDescriptor(\.date, order: .reverse)])
        return try context.fetch(descriptor).map {
            SavedSong(
                id: $0.id,
                title: $0.title,
                artist: $0.artist,
                lyrics: $0.lyrics,
                date: $0.date
            )
        }
    }
    
    public func deleteSong(id: UUID) throws {
        let predicate = #Predicate<SongEntity> { $0.id == id }
        let descriptor = FetchDescriptor<SongEntity>(predicate: predicate)
        if let song = try context.fetch(descriptor).first {
            context.delete(song)
            try context.save()
        }
    }
}

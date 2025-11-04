//
//  SongEntity.swift
//  Storage
//
//  Created by Jung Hwan Park on 11/4/25.
//

import SwiftData
import Foundation
import StorageInterface

@Model
final public class SongEntity {
    @Attribute(.unique) public var id: UUID
    public var title: String
    public var artist: String
    public var lyrics: String
    public var date: Date
    
    public init(id: UUID, title: String, artist: String, lyrics: String, date: Date) {
        self.id = id
        self.title = title
        self.artist = artist
        self.lyrics = lyrics
        self.date = date
    }
}

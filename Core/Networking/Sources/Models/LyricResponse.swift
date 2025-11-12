//
//  LyricResponse.swift
//  Networking
//
//  Created by Jung Hwan Park on 10/10/25.
//

import Foundation

public struct LyricSong: Codable {
    public let id: Int
    public let name, trackName, artistName, albumName: String
    public let duration: Double
    public let instrumental: Bool
    public let plainLyrics: String
    public let syncedLyrics: String?
    
    public init(
        id: Int,
        name: String,
        trackName: String,
        artistName: String,
        albumName: String,
        duration: Double,
        instrumental: Bool,
        plainLyrics: String,
        syncedLyrics: String?
    ) {
        self.id = id
        self.name = name
        self.trackName = trackName
        self.artistName = artistName
        self.albumName = albumName
        self.duration = duration
        self.instrumental = instrumental
        self.plainLyrics = plainLyrics
        self.syncedLyrics = syncedLyrics
    }
}

public typealias LyricResponse = [LyricSong]

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
    public let plainLyrics, syncedLyrics: String
}

public typealias LyricResponse = [LyricSong]

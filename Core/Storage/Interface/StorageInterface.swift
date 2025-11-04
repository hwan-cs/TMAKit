import Foundation

public protocol SongStorage {
    func saveSong(_ song: SavedSong) throws
    func fetchAllSongs() throws -> [SavedSong]
    func deleteSong(id: UUID) throws
}

public struct SavedSong: Codable, Identifiable, Hashable {
    public let id: UUID
    public let title: String
    public let artist: String
    public let lyrics: String
    public let date: Date
    
    public init(id: UUID = UUID(), title: String, artist: String, lyrics: String, date: Date = .now) {
        self.id = id
        self.title = title
        self.artist = artist
        self.lyrics = lyrics
        self.date = date
    }
}

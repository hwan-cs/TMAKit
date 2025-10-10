//
//  LyricsAPI.swift
//  Networking
//
//  Created by Jung Hwan Park on 10/10/25.
//

import Moya
import Foundation

public enum LyricsAPI {
    case getLyrics(trackName: String?, artistName: String?, albumName: String?)
    /// Search for keyword present in ANY fields (track's title, artist name or album name)
    case searchByLyric(keyword: String)
}

extension LyricsAPI: TargetType {
    public var baseURL: URL {
        return URL(string: "https://lrclib.net")!
    }
    
    public var path: String {
        switch self {
        case .getLyrics, .searchByLyric:
            return "/api/search"
        }
    }
    
    public var method: Moya.Method {
        switch self {
        case .getLyrics, .searchByLyric:
            return .get
        }
    }
    
    public var task: Task {
        switch self {
        case .getLyrics(let trackName, let artistName, let albumName):
            var params = [String: Any]()
            if let trackName {
                params["track_name"] = trackName
            }
            if let artistName {
                params["artist_name"] = artistName
            }
            if let albumName {
                params["album_name"] = albumName
            }
            return .requestParameters(
                parameters: params,
                encoding: URLEncoding.queryString
            )
        case .searchByLyric(let keyword):
            return .requestParameters(
                parameters: ["q": keyword],
                encoding: URLEncoding.queryString
            )
        }
    }
    
    public var headers: [String: String]? {
        return ["Content-Type": "application/json"]
    }
}

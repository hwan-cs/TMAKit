//
//  LyricsServiceMock.swift
//  LyricsTesting
//
//  Created by Jung Hwan Park on 11/12/25.
//

import ShazamKit
import Foundation
import Networking
import LyricsInterface
import CommonInterface

public final class LyricsServiceMock: LyricsServiceInterface {
    public var fetchLyricsCalled = false
    public var getCurrentTrackLyricsCalled = false
    
    public var mockResponse: LyricResponse = []
    public var mockError: Error?
    
    public init() {}
    
    public func fetchLyrics(for item: SHMediaItem) async throws -> LyricResponse {
        fetchLyricsCalled = true
        if let error = mockError {
            throw error
        }
        return mockResponse
    }
    
    public func getCurrentTrackLyrics() async throws -> LyricResponse {
        getCurrentTrackLyricsCalled = true
        if let error = mockError {
            throw error
        }
        return mockResponse
    }
}

public enum MockError: Error, LocalizedError {
    case genericError
    public var errorDescription: String? {
        switch self {
        case .genericError:
            return "A mock error occurred."
        }
    }
}

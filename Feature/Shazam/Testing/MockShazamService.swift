//
//  MockShazamService.swift
//  Shazam
//
//  Created by Jung Hwan Park on 9/24/25.
//

import Combine
import ShazamKit
import Foundation
import ShazamInterface

@MainActor
public class MockShazamService: ShazamServiceInterface, ObservableObject {
    @Published public var currentItem: SHMediaItem?
    @Published public var isShazaming = false
    
    public var startRecognitionCalled = false
    public var stopRecognitionCalled = false
    public var shouldThrowError = false
    public var errorToThrow: Error = ShazamError.audioEngineFailure
    
    public init() {}
    
    public func startRecognition() async throws {
        startRecognitionCalled = true
        
        if shouldThrowError {
            throw errorToThrow
        }
        
        isShazaming = true
    }
    
    public func stopRecognition() {
        stopRecognitionCalled = true
        isShazaming = false
    }
    
    public func simulateMatch(title: String, artist: String) {
        let mockItem = MockSHMediaItem(title: title, artist: artist)
        currentItem = mockItem
        isShazaming = false
    }
    
    public func simulateNoMatch() {
        isShazaming = false
    }
}

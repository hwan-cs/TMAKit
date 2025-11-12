//
//  MockAudioEngine.swift
//  Shazam
//
//  Created by Jung Hwan Park on 9/24/25.
//

import AVFAudio
import ShazamInterface

public class MockAudioEngine: AudioEngineInterface {
    public let engine = AVAudioEngine()
    
    public var isRunning = false
    public var startCalled = false
    public var stopCalled = false
    public var shouldThrowOnStart = false
    
    public func start() throws {
        startCalled = true
        if shouldThrowOnStart {
            throw ShazamError.audioEngineFailure
        }
        isRunning = true
    }
    
    public func stop() {
        stopCalled = true
        isRunning = false
    }
    
    public init() { }
}

public enum ShazamError: Error {
    case audioEngineFailure
    case permissionDenied
}

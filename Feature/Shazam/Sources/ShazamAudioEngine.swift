//
//  ShazamAudioEngine.swift
//  Shazam
//
//  Created by Jung Hwan Park on 9/24/25.
//

import AVKit
import ShazamInterface

public class ShazamAudioEngine: AudioEngineInterface {
    public let engine = AVAudioEngine()
    
    public var isRunning: Bool {
        engine.isRunning
    }
    
    public func start() throws {
        try engine.start()
    }
    
    public func stop() {
        engine.stop()
    }
    
    public init() {}
}


//
//  ShazamService.swift
//  Shazam
//
//  Created by Jung Hwan Park on 9/23/25.
//

import AVKit
import Combine
import ShazamKit
import ShazamInterface
import CommonInterface

@MainActor
public class ShazamService: NSObject, ShazamServiceInterface, ObservableObject {
    @Published public private(set) var currentItem: SHMediaItem? = nil
    @Published public private(set) var isShazaming = false
    
    private let session: SHSession
    private let audioEngine: AudioEngineInterface
    private let audioSession: AVAudioSession
    private let musicState: any MusicStateServiceInterface
    
    public init(
        session: SHSession = SHSession(),
        audioEngine: AudioEngineInterface = ShazamAudioEngine(),
        audioSession: AVAudioSession = .sharedInstance(),
        musicState: any MusicStateServiceInterface
    ) {
        self.session = session
        self.audioEngine = audioEngine
        self.audioSession = audioSession
        self.musicState = musicState
        super.init()
        session.delegate = self
    }
    
    private func prepareAudioRecording() throws {
        try audioSession.setCategory(.record)
        try audioSession.setActive(true, options: .notifyOthersOnDeactivation)
    }
    
    private func generateSignature() {
        let inputNode = audioEngine.engine.inputNode
        let recordingFormat = inputNode.outputFormat(forBus: .zero)
        
        inputNode.installTap(onBus: .zero, bufferSize: 1024, format: recordingFormat) { [weak session] buffer, _ in
            session?.matchStreamingBuffer(buffer, at: nil)
        }
    }
    
    private func startAudioRecording() throws {
        try audioEngine.start()
        isShazaming = true
    }
    
    public func startRecognition() {
        do {
            if audioEngine.isRunning {
                stopRecognition()
                return
            }
            
            try prepareAudioRecording()
            generateSignature()
            try startAudioRecording()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    public func stopRecognition() {
        isShazaming = false
        audioEngine.stop()
        audioEngine.engine.inputNode.removeTap(onBus: .zero)
    }
}

extension ShazamService: @preconcurrency SHSessionDelegate {
    public func session(_ session: SHSession, didFind match: SHMatch) {
        guard let mediaItem = match.mediaItems.first else { return }
        Task { @MainActor in
            self.currentItem = mediaItem
            self.musicState.updateCurrentTrack(mediaItem)
        }
    }
    
    public func session(_ session: SHSession, didNotFindMatchFor signature: SHSignature, error: Error?) {
        Task { @MainActor in
            self.isShazaming = false
        }
    }
}

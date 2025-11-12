//
//  ShazamServiceTests.swift
//  Shazam
//
//  Created by Jung Hwan Park on 9/24/25.
//

import Testing
import Shazam
import Common
import ShazamKit
import ShazamTesting
import ShazamInterface
import CommonInterface

@MainActor
@Suite struct ShazamServiceTests {
    private var mockAudioEngine: MockAudioEngine!
    private var service: ShazamService!
    private var musicState: (any MusicStateServiceInterface)!
    
    init() throws {
        mockAudioEngine = MockAudioEngine()
        service = ShazamService(audioEngine: mockAudioEngine, musicState: MusicStateService())
    }
    
    @Test
    func testStartRecognition_WhenNotRunning_StartsAudioEngine() async throws {
        // Given
        #expect(service.isShazaming == false)
        
        // When
        service.startRecognition()
        
        // Then
        #expect(mockAudioEngine.startCalled)
        #expect(service.isShazaming)
    }
    
    @Test
    func testStartRecognition_WhenAlreadyRunning_StopsFirst() async throws {
        // Given
        mockAudioEngine.isRunning = true
        
        // When
        service.startRecognition()
        
        // Then
        #expect(mockAudioEngine.stopCalled)
        #expect(service.isShazaming == false)
    }
    
    @Test
    func testStopRecognition_StopsAudioEngine() {
        // Given
        service.startRecognition()
        
        // When
        service.stopRecognition()
        
        // Then
        #expect(mockAudioEngine.stopCalled)
        #expect(service.isShazaming == false)
    }
}


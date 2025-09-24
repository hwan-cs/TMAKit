//
//  ShazamServiceTests.swift
//  Shazam
//
//  Created by Jung Hwan Park on 9/24/25.
//

import XCTest
@testable import Shazam
@testable import ShazamTesting
import ShazamInterface
import ShazamKit

@MainActor
final class ShazamServiceTests: XCTestCase {
    private var mockAudioEngine: MockAudioEngine!
    private var service: ShazamService!
    
    override func setUp() {
        super.setUp()
        mockAudioEngine = MockAudioEngine()
        service = ShazamService(audioEngine: mockAudioEngine)
    }
    
    override func tearDown() {
        service = nil
        mockAudioEngine = nil
        super.tearDown()
    }
    
    func testStartRecognition_WhenNotRunning_StartsAudioEngine() async throws {
        // Given
        XCTAssertFalse(service.isShazaming)
        
        // When
        service.startRecognition()
        
        // Then
        XCTAssertTrue(mockAudioEngine.startCalled)
        XCTAssertTrue(service.isShazaming)
    }
    
    func testStartRecognition_WhenAlreadyRunning_StopsFirst() async throws {
        // Given
        mockAudioEngine.isRunning = true
        
        // When
        service.startRecognition()
        
        // Then
        XCTAssertTrue(mockAudioEngine.stopCalled)
        XCTAssertFalse(service.isShazaming)
    }
    
    func testStopRecognition_StopsAudioEngine() {
        // Given
        service.startRecognition()
        
        // When
        service.stopRecognition()
        
        // Then
        XCTAssertTrue(mockAudioEngine.stopCalled)
        XCTAssertFalse(service.isShazaming)
    }
}


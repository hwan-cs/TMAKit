//
//  MusicStateService.swift
//  Common
//
//  Created by Jung Hwan Park on 9/25/25.
//

import Foundation
import ShazamKit
import Combine
import CommonInterface

@MainActor
public class MusicStateService: MusicStateServiceInterface {
    @Published public private(set) var currentTrack: SHMediaItem?
    
    public var currentTrackPublisher: AnyPublisher<SHMediaItem, Never> {
        $currentTrack
            .compactMap { $0 }
            .eraseToAnyPublisher()
    }
    
    public init() {}
    
    nonisolated public func updateCurrentTrack(_ item: SHMediaItem?) {
        Task { @MainActor in
            currentTrack = item
        }
    }
    
    public func clearCurrentTrack() {
        currentTrack = nil
    }
}


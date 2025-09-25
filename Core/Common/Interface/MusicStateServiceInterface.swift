//
//  MusicStateServiceInterface.swift
//  Common
//
//  Created by Jung Hwan Park on 9/25/25.
//

import Foundation
import ShazamKit
import Combine

@MainActor
public protocol MusicStateServiceInterface: ObservableObject {
    var currentTrack: SHMediaItem? { get }
    var currentTrackPublisher: AnyPublisher<SHMediaItem, Never> { get }
    
    func updateCurrentTrack(_ item: SHMediaItem?)
    func clearCurrentTrack()
}

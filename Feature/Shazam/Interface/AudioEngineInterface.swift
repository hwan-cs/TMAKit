//
//  AudioEngineInterface.swift
//  Shazam
//
//  Created by Jung Hwan Park on 9/24/25.
//

import Foundation
import AVKit

public protocol AudioEngineInterface {
    var engine: AVAudioEngine { get }
    var isRunning: Bool { get }
    func start() throws
    func stop()
}

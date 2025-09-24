//
//  ShazamServiceInterface.swift
//  Shazam
//
//  Created by Jung Hwan Park on 9/24/25.
//

import Foundation
import ShazamKit

@MainActor
public protocol ShazamServiceInterface {
    var currentItem: SHMediaItem? { get }
    var isShazaming: Bool { get }
    
    func startRecognition() async throws
    func stopRecognition()
}

//
//  MockSHMediaItem.swift
//  Shazam
//
//  Created by Jung Hwan Park on 9/24/25.
//

import ShazamKit

public class MockSHMediaItem: SHMediaItem {
    private let mockTitle: String
    private let mockArtist: String
    
    public init(title: String, artist: String) {
        self.mockTitle = title
        self.mockArtist = artist
        super.init()
    }
    
    public override var title: String? {
        return mockTitle
    }
    
    public override var artist: String? {
        return mockArtist
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

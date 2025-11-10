//
//  LyricsAPITests.swift
//  NetworkingTesting
//
//  Created by Jung Hwan Park on 11/10/25.
//

import Moya
import Testing
import Networking
import Foundation
import NetworkingTesting

@Suite struct LyricsAPITests {
    
    @Test func testGetLyricsParameters() {
        let target = LyricsAPI.getLyrics(trackName: "Pretty Sweet", artistName: "Frank Ocean", albumName: "Blonde")
        let task = target.task
        
        guard case let .requestParameters(parameters, _) = task else {
            return
        }
        
        #expect(parameters["track_name"] as? String == "Pretty Sweet")
        #expect(parameters["artist_name"] as? String == "Frank Ocean")
        #expect(parameters["album_name"] as? String == "Blonde")
    }
    
    @Test func testSearchByLyricParameters() {
        let target = LyricsAPI.searchByLyric(keyword: "sweet")
        guard case let .requestParameters(parameters, _) = target.task else {
            return
        }
        
        #expect(parameters["q"] as? String == "sweet")
    }
    
    @Test func testSampleDataDecoding() throws {
        let jsonData = LyricsAPI.getLyrics(trackName: nil, artistName: nil, albumName: nil).sampleData
        let decoded = try JSONDecoder().decode(LyricResponse.self, from: jsonData)
        
        #expect(decoded.count == 1)
        #expect(decoded.first?.artistName == "Frank Ocean")
        #expect(decoded.first?.trackName == "Pretty Sweet")
        #expect(decoded.first!.instrumental == false)
    }
    
    @Test func testMoyaProviderStubResponse() throws {
        let provider = MockLyricsAPIProvider.make()
        
        provider.request(.searchByLyric(keyword: "testMoyaProviderStubResponse")) { result in
            switch result {
            case .success(let response):
                #expect(response.statusCode == 200)
                let decoded = try? JSONDecoder().decode(LyricResponse.self, from: response.data)
                #expect(decoded?.first?.artistName == "Frank Ocean")
            case .failure(let error):
                Issue.record("Unexpected error: \(error)")
            }
        }
    }
}

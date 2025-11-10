//
//  MockLyricsService.swift
//  NetworkingTesting
//
//  Created by Jung Hwan Park on 11/10/25.
//

import Moya
import Foundation
import Networking

public enum MockLyricsAPIProvider {
    /// Creates a provider that immediately stubs responses using local JSON or data.
    public static func make(
        sampleData: Data? = nil,
        statusCode: Int = 200
    ) -> MoyaProvider<LyricsAPI> {
        let endpointClosure = { (target: LyricsAPI) -> Endpoint in
            let data = sampleData ?? target.sampleData
            return Endpoint(
                url: URL(target: target).absoluteString,
                sampleResponseClosure: { .networkResponse(statusCode, data) },
                method: target.method,
                task: target.task,
                httpHeaderFields: target.headers
            )
        }
        
        return MoyaProvider<LyricsAPI>(
            endpointClosure: endpointClosure,
            stubClosure: MoyaProvider.immediatelyStub
        )
    }
}

extension LyricsAPI {
    /// Provide default sample data for test stubbing
    public var sampleData: Data {
        switch self {
        case .getLyrics, .searchByLyric:
            return """
            [
            {
            "id": 421113,
            "name": "Pretty Sweet",
            "trackName": "Pretty Sweet",
            "artistName": "Frank Ocean",
            "albumName": "Blonde",
            "duration": 158,
            "instrumental": false,
            "plainLyrics": "Now To the edge I'll race To the end I'll make it All the risk, I'll take it Headbang with my four friends We pour a taste out for the dead This is the blood, the body, the life right now The height right now Might be what I need Might be what I need Said you wanna hurt me now You can't end me now That might be what you need What it means to be alive on this side Said you wanna kill me now On this side Don't let me down On this side Down, down Fuck the other side I'm on this side, I'm on this side, I'm on this side How it feels to have arrived I'm inside, I'm inside Those are my niggas for life Mother of us be kind To the fathers on whom we rely Fathers of us be kind To the mothers on whom we rely Ah-ah-ahhh, ah-ah-ahh, ah-ah-ahhhh Ah-ah-ahhh, ah-ah-ahh, ah-ah-ahhhh We know you're sugar We know you're sweet like a sucka Pretty sweet Pretty sweet",
            "syncedLyrics": "[00:00.66] Now [00:02.06] To the edge I'll race [00:03.52] To the end I'll make it [00:04.94] All the risk, I'll take it [00:06.03] Headbang with my four friends [00:08.18] We pour a taste out for the dead [00:09.02] This is the blood, the body, the life right now [00:12.06] The height right now [00:13.59] Might be what I need [00:16.63] Might be what I need [00:19.69] Said you wanna hurt me now [00:23.06] You can't end me now [00:25.77] That might be what you need [00:27.52] What it means to be alive on this side [00:32.18] Said you wanna kill me now [00:33.67] On this side [00:35.59] Don't let me down [00:37.22] On this side [00:38.21] Down, down [00:39.03] Fuck the other side [00:42.69] I'm on this side, I'm on this side, I'm on this side [00:52.17] How it feels to have arrived [00:54.93] I'm inside, I'm inside [01:00.13] Those are my niggas for life [01:03.35] [01:07.16] Mother of us be kind [01:12.20] To the fathers on whom we rely [01:18.61] Fathers of us be kind [01:24.94] To the mothers on whom we rely [01:32.31] [01:34.71] Ah-ah-ahhh, ah-ah-ahh, ah-ah-ahhhh [01:40.65] Ah-ah-ahhh, ah-ah-ahh, ah-ah-ahhhh [01:57.06] [02:03.73] We know you're sugar [02:06.48] We know you're sweet like a sucka [02:12.91] Pretty sweet [02:19.47] [02:22.23] Pretty sweet [02:29.72] "
            }
            ]
            """.data(using: .utf8)!
        }
    }
}

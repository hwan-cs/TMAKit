//
//  LyricsHistoryView.swift
//  Lyrics
//
//  Created by Jung Hwan Park on 11/4/25.
//

import Storage
import SwiftUI
import SwiftData

struct LyricsHistoryView: View {
    
    @Query(sort: \SongEntity.date, order: .reverse)
    var savedSongs: [SongEntity]
    
    var body: some View {
        List(savedSongs) { song in
            HStack {
                NavigationLink {
                    ScrollView(.vertical) {
                        VStack {
                            Text(song.lyrics)
                                .multilineTextAlignment(.leading)
                                .fontWeight(.medium)
                                .padding()
                        }
                    }
                    .textSelection(.enabled)
                    .scrollIndicators(.never)
                    .navigationTitle("\(song.artist) - \(song.title)")
                    .navigationBarTitleDisplayMode(.inline)
                } label: {
                    Text("\(song.artist) - \(song.title)")
                        .bold()
                }
            }
        }
    }
}

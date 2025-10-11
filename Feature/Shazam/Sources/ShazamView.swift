//
//  ShazamView.swift
//  FeatureA
//
//  Created by Jung Hwan Park on 9/7/25.
//

import SwiftUI
import Common
import ShazamInterface

public struct ShazamView: View {
    @ObservedObject private var service: ShazamService
    
    public init(service: ShazamService) {
        self.service = service
    }
    
    public var body: some View {
        NavigationView {
            VStack(spacing: 8) {
                Spacer()
                
                trackInfoView
                
                Spacer()
                
                Spacer()
                
                shazamButton
            }
            .padding(20)
            .navigationTitle("Shazam")
        }
    }
    
    @ViewBuilder
    private var trackInfoView: some View {
        AsyncImage(url: service.currentItem?.artworkURL) { phase in
            switch phase {
            case .empty:
                Color.gray.opacity(0.2)
            case .success(let image):
                image
                    .resizable()
                    .scaledToFit()
            case .failure:
                Image(systemName: "music.note")
                    .font(.system(size: 60))
                    .foregroundStyle(.secondary)
            @unknown default:
                EmptyView()
            }
        }
        .frame(width: 200, height: 200)
        .clipShape(
            RoundedRectangle(cornerRadius: 12)
        )
        .shadow(radius: 4)
        
        VStack(spacing: 8) {
            Text(service.currentItem?.title ?? "Press the button below to Shazam")
                .font(.title3.bold())
                .multilineTextAlignment(.center)
            
            if let artist = service.currentItem?.artist {
                Text(artist)
                    .font(.body)
                    .foregroundStyle(.secondary)
            }
        }
        .padding()
    }
    
    private var shazamButton: some View {
        Button {
            service.isShazaming ? service.stopRecognition() : service.startRecognition()
        } label: {
            Text(service.isShazaming ? "Stop Shazam" : "Start Shazam")
                .font(.headline.bold())
                .frame(maxWidth: .infinity)
                .frame(height: 48)
                .foregroundStyle(.white)
                .background(
                    Capsule()
                        .fill(service.isShazaming ? Color.red : Color.accentColor)
                )
        }
        .animation(.easeInOut(duration: 0.2), value: service.isShazaming)
    }
}

#Preview {
    ShazamView(service: .init(musicState: MusicStateService()))
}

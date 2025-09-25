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
                AsyncImage(url: service.currentItem?.artworkURL) { image in
                    image.image?.resizable().scaledToFit()
                }
                .frame(width: 200, height: 200, alignment: .center)
                
                Text(service.currentItem?.title ?? "Press the button below to Shazam")
                    .font(.title3.bold())
                
                Text(service.currentItem?.artist ?? "")
                    .font(.body)
                
                Spacer()
                
                Spacer()
                if service.isShazaming {
                    Button {
                        service.stopRecognition()
                    } label: {
                        Text("Stop Shazam")
                            .font(.headline.bold())
                            .frame(maxWidth: .infinity)
                            .frame(height: 48)
                            .foregroundStyle(Color.white)
                            .background(
                                Capsule(style: .continuous)
                                    .fill(Color.red)
                            )
                    }
                } else {
                    Button {
                        service.startRecognition()
                    } label: {
                        Text("Start Shazam")
                            .font(.headline.bold())
                            .frame(maxWidth: .infinity)
                            .frame(height: 48)
                            .foregroundStyle(Color.white)
                            .background(
                                Capsule(style: .continuous)
                                    .fill(Color.accentColor)
                            )
                    }
                }
            }
            .padding(20)
            .navigationTitle("Shazam")
        }
    }
}

#Preview {
    ShazamView(service: .init(musicState: MusicStateService()))
}

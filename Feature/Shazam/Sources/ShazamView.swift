//
//  ShazamView.swift
//  FeatureA
//
//  Created by Jung Hwan Park on 9/7/25.
//

import SwiftUI

public struct ShazamView: View {
    @StateObject private var viewModel = ShazamViewModel()
    
    public init() {}
    
    public var body: some View {
        NavigationView {
            VStack(spacing: 8) {
                Spacer()
                AsyncImage(url: viewModel.currentItem?.artworkURL) { image in
                    image.image?.resizable().scaledToFit()
                }
                .frame(width: 200, height: 200, alignment: .center)
                
                Text(viewModel.currentItem?.title ?? "Press the button below to Shazam")
                    .font(.title3.bold())
                
                Text(viewModel.currentItem?.artist ?? "")
                    .font(.body)
                
                Spacer()
                
                Spacer()
                if viewModel.shazaming {
                    Button {
                        viewModel.stopRecognition()
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
                        viewModel.startRecognition()
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
    ShazamView()
}

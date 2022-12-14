//
//  VideoPlayerView.swift
//  AfricaApp_SwiftUI
//
//  Created by Igor Ashurkov on 10.12.2022.
//

import SwiftUI
import AVKit

struct VideoPlayerView: View {
    
    // MARK: Properties
    
    var videoSelected: String
    var videoTitle: String
    
    // MARK: Body
    
    var body: some View {
        VStack {
            VideoPlayer(player: playVideo(name: self.videoSelected, type: "mp4"))
            .overlay(
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 32, height: 32)
                    .padding(.top, 6)
                    .padding(.horizontal, 8)
                , alignment: .topLeading
            )
        } //: VStack
        .accentColor(.accentColor)
        .navigationTitle(self.videoTitle)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct VideoPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            VideoPlayerView(videoSelected: "lion", videoTitle: "Lion")
        }
    }
}

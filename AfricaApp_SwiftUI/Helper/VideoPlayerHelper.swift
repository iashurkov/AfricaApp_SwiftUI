//
//  VideoPlayerHelper.swift
//  AfricaApp_SwiftUI
//
//  Created by Igor Ashurkov on 14.12.2022.
//

import Foundation
import AVKit

var videoPlayer: AVPlayer?

func playVideo(name: String, type: String) -> AVPlayer? {
    if let fileURL = Bundle.main.url(forResource: name, withExtension: type) {
        videoPlayer = AVPlayer(url: fileURL)
        videoPlayer?.play()
    }
    
    return videoPlayer
}

//
//  VideoModel.swift
//  AfricaApp_SwiftUI
//
//  Created by Igor Ashurkov on 10.12.2022.
//

import Foundation

struct Video: Codable, Identifiable {
    let id: String
    let name: String
    let headline: String
    
    var thumbnail: String {
        "video-\(self.id)"
    }
}

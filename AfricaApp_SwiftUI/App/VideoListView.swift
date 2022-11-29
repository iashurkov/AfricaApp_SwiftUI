//
//  VideoListView.swift
//  AfricaApp_SwiftUI
//
//  Created by Igor Ashurkov on 29.11.2022.
//

import SwiftUI

struct VideoListView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Videos")
        }
        .padding()
    }
}

struct VideoListView_Previews: PreviewProvider {
    static var previews: some View {
        VideoListView()
    }
}

//
//  VideoListView.swift
//  AfricaApp_SwiftUI
//
//  Created by Igor Ashurkov on 29.11.2022.
//

import SwiftUI

struct VideoListView: View {
    
    // MARK: Properties
    
    @State private var videos: [Video] = Bundle.main.decode("videos.json")
    
    private let hapticImpact = UIImpactFeedbackGenerator(style: .medium)
    
    // MARK: Body
    
    var body: some View {
        NavigationView {
            List {
                ForEach(self.videos) { item in
                    VideoListItemView(model: item)
                        .padding(.vertical, 8)
                } //: ForEach
            } //: List
            .navigationTitle("Videos")
            .navigationBarTitleDisplayMode(.inline)
            .listStyle(InsetGroupedListStyle())
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        self.videos.shuffle()
                        self.hapticImpact.impactOccurred()
                    }) {
                        Image(systemName: "arrow.2.squarepath")
                            .foregroundColor(.accentColor)
                    } //: Button
                } //: ToolbarItem
            } //: toolbar
        } //: NavigationView
    }
}

struct VideoListView_Previews: PreviewProvider {
    static var previews: some View {
        VideoListView()
    }
}

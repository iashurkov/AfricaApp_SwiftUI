//
//  MainView.swift
//  AfricaApp_SwiftUI
//
//  Created by Igor Ashurkov on 29.11.2022.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView() {
            ContentView()
                .tabItem {
                    Image(systemName: "square.grid.2x2")
                    Text("Browse")
                } //: Tab item ContentView
            
            VideoListView()
                .tabItem {
                    Image(systemName: "play.rectangle")
                    Text("Watch")
                } //: Tab item VideoListView
            
            MapView()
                .tabItem {
                    Image(systemName: "map")
                    Text("Locations")
                } //: Tab item MapView
            
            GalleryView()
                .tabItem {
                    Image(systemName: "photo")
                    Text("Gallery")
                } //: Tab item GalleryView
        } //: TabView
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

//
//  MapView.swift
//  AfricaApp_SwiftUI
//
//  Created by Igor Ashurkov on 29.11.2022.
//

import SwiftUI

struct MapView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Map")
        }
        .padding()
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}

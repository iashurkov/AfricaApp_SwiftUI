//
//  GalleryView.swift
//  AfricaApp_SwiftUI
//
//  Created by Igor Ashurkov on 29.11.2022.
//

import SwiftUI

struct GalleryView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Gallery")
        }
        .padding()
    }
}

struct GalleryView_Previews: PreviewProvider {
    static var previews: some View {
        GalleryView()
    }
}

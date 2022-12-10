//
//  HeadingView.swift
//  AfricaApp_SwiftUI
//
//  Created by Igor Ashurkov on 07.12.2022.
//

import SwiftUI

struct HeadingView: View {
    
    // MARK: Properties
    
    var image: String
    var text: String
    
    // MARK: Body
    
    var body: some View {
        HStack {
            
            Image(systemName: self.image)
                .foregroundColor(.accentColor)
                .imageScale(.large)
            
            Text(self.text)
                .font(.title3)
                .fontWeight(.bold)
        } //: HStack
        .padding(.vertical)
    }
}

struct HeadingView_Previews: PreviewProvider {
    static var previews: some View {
        HeadingView(image: "photo.on.rectangle.angled",
                    text: "Wilderness in Pictures")
            .previewLayout(.sizeThatFits)
            .padding()
    }
}

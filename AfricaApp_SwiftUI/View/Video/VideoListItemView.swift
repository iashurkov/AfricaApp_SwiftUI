//
//  VideoListItem.swift
//  AfricaApp_SwiftUI
//
//  Created by Igor Ashurkov on 10.12.2022.
//

import SwiftUI

struct VideoListItemView: View {
    
    // MARK: Properties
    
    let model: Video
    
    // MARK: Body
    
    var body: some View {
        HStack(spacing: 10) {
            ZStack {
                Image(self.model.thumbnail)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 80)
                    .cornerRadius(9)
                
                Image(systemName: "play.circle")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 32)
                    .shadow(radius: 4)
            } //: ZStack
            
            VStack(alignment: .leading, spacing: 10) {
                Text(self.model.name)
                    .font(.title2)
                    .fontWeight(.heavy)
                    .foregroundColor(.accentColor)
                
                Text(self.model.headline)
                    .font(.footnote)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
            } //: VStack
            
        } //: HStack
    }
}

struct VideoListItem_Previews: PreviewProvider {
    
    private static let testData: [Video] = Bundle.main.decode("videos.json")
    
    static var previews: some View {
        VideoListItemView(model: self.testData[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}

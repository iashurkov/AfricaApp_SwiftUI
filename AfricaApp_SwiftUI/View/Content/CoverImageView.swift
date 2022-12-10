//
//  CoverImageView.swift
//  AfricaApp_SwiftUI
//
//  Created by Igor Ashurkov on 04.12.2022.
//

import SwiftUI

struct CoverImageView: View {
    
    // MARK: Properties
    
    let model: [CoverImage]
    
    // MARK: Body
    
    var body: some View {
        TabView {
            ForEach(self.model) { item in
                Image(item.name)
                    .resizable()
                    .scaledToFit()
            } //: ForEach
        } //: TabView
        .tabViewStyle(PageTabViewStyle())
    }
}

struct CoverImageView_Previews: PreviewProvider {
    
    private static let testData: [CoverImage] = Bundle.main.decode("covers.json")
    
    static var previews: some View {
        CoverImageView(model: self.testData)
            .previewLayout(.fixed(width: 400, height: 300))
    }
}

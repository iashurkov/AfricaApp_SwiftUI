//
//  InsetGalleryView.swift
//  AfricaApp_SwiftUI
//
//  Created by Igor Ashurkov on 07.12.2022.
//

import SwiftUI

struct InsetGalleryView: View {
    
    // MARK: Properties
    
    let model: Animal
    
    // MARK: Body
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .center, spacing: 15) {
                ForEach(self.model.gallery, id: \.self) { item in
                    Image(item)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 200)
                        .cornerRadius(12)
                }
            } //: HStack
        } //: ScrollView
    }
}

struct InsetGalleryView_Previews: PreviewProvider {
    
    private static let testData: [Animal] = Bundle.main.decode("animals.json")
    
    static var previews: some View {
        InsetGalleryView(model: self.testData[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}

//
//  AnimalDetailView.swift
//  AfricaApp_SwiftUI
//
//  Created by Igor Ashurkov on 07.12.2022.
//

import SwiftUI

struct AnimalDetailView: View {
    
    // MARK: Properties
    
    let model: Animal
    
    // MARK: Body
    
    var body: some View {
        
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .center, spacing: 20) {
                // Hero image
                Image(self.model.image)
                    .resizable()
                    .scaledToFit()
                
                // Title
                Text(self.model.name.uppercased())
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.center)
                    .padding(.vertical, 8)
                    .foregroundColor(.primary)
                    .background(
                        Color.accentColor
                            .frame(height: 6)
                            .offset(y: 24)
                    )
                
                // Headline
                Text(self.model.headline)
                    .font(.headline)
                    .multilineTextAlignment(.leading)
                    .foregroundColor(.accentColor)
                    .padding(.horizontal)
                
                // Gallery
                Group {
                    HeadingView(image: "photo.on.rectangle.angled",
                                text: "Wilderness in Pictures")
                    
                    InsetGalleryView(model: self.model)
                } //: Group
                .padding(.horizontal)
                
                // Facts
                Group {
                    HeadingView(image: "questionmark.circle",
                                text: "Did you know?")
                    
                    InsetFactView(model: self.model)
                } //: Group
                .padding(.horizontal)
                
                // Description
                Group {
                    HeadingView(image: "info.circle",
                                text: "All about \(self.model.name)")
                    
                    Text(self.model.description)
                        .multilineTextAlignment(.leading)
                        .layoutPriority(1)
                } //: Group
                .padding(.horizontal)
                
                // Map
                Group {
                    HeadingView(image: "map",
                                text: "National Parks")
                    
                    InsetMapView()
                } //: Group
                .padding(.horizontal)
                
                // Link
                Group {
                    HeadingView(image: "books.vertical",
                                text: "Lear More")
                    
                    ExternalWeblinkView(model: self.model)
                } //: Group
                .padding(.horizontal)
                
            } //: VStack
            .navigationTitle("Learn about \(self.model.name)")
            .navigationBarTitleDisplayMode(.inline)
        } //: ScrollView
    }
}

struct AnimalDetailView_Previews: PreviewProvider {
    
    private static let testData: [Animal] = Bundle.main.decode("animals.json")
    
    static var previews: some View {
        NavigationView {
            AnimalDetailView(model: self.testData[0])
        } //: NavigationView
    }
}

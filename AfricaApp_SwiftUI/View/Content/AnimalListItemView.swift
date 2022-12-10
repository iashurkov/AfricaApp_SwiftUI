//
//  AnimalListItemView.swift
//  AfricaApp_SwiftUI
//
//  Created by Igor Ashurkov on 06.12.2022.
//

import SwiftUI

struct AnimalListItemView: View {
    
    // MARK: Properties
    
    let model: Animal
    
    // MARK: Body
    
    var body: some View {
        HStack(alignment: .center, spacing: 16) {
            Image(self.model.image)
                .resizable()
                .scaledToFill()
                .frame(width: 90, height: 90)
                .clipShape(
                    RoundedRectangle(cornerRadius: 12)
                )
                
            VStack(alignment: .leading, spacing: 8) {
                Text(self.model.name)
                    .font(.title2)
                    .fontWeight(.heavy)
                    .foregroundColor(.accentColor)
                
                Text(self.model.headline)
                    .font(.footnote)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
                    .padding(.trailing, 8)
            } //: VStack
        } //: HStack
    }
}

struct AnimalListItemView_Previews: PreviewProvider {
    
    private static let testData: [Animal] = Bundle.main.decode("animals.json")
    
    static var previews: some View {
        AnimalListItemView(model: self.testData[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}

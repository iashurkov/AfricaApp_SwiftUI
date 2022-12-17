//
//  AnimalGridItemView.swift
//  AfricaApp_SwiftUI
//
//  Created by Igor Ashurkov on 17.12.2022.
//

import SwiftUI

struct AnimalGridItemView: View {
    
    // MARK: Properties
    
    let model: Animal
    
    // MARK: Body
    
    var body: some View {
        Image(self.model.image)
            .resizable()
            .scaledToFit()
            .cornerRadius(12)
    }
}

struct AnimalGridItemView_Previews: PreviewProvider {
    
    private static let testData: [Animal] = Bundle.main.decode("animals.json")
    
    static var previews: some View {
        AnimalGridItemView(model: self.testData[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}

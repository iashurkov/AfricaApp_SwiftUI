//
//  InsetFactView.swift
//  AfricaApp_SwiftUI
//
//  Created by Igor Ashurkov on 07.12.2022.
//

import SwiftUI

struct InsetFactView: View {
    
    // MARK: Properties
    
    let model: Animal
    
    // MARK: Body
    
    var body: some View {
        GroupBox {
            TabView {
                ForEach(self.model.fact, id: \.self) { item in
                    Text(item)
                } //: ForEach
            } //: TabView
            .tabViewStyle(PageTabViewStyle())
            .frame(minHeight: 148, idealHeight: 168, maxHeight: 180)
        } //: GroupBox
    }
}

struct InsetFactView_Previews: PreviewProvider {
    
    private static let testData: [Animal] = Bundle.main.decode("animals.json")
    
    static var previews: some View {
        InsetFactView(model: self.testData[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}

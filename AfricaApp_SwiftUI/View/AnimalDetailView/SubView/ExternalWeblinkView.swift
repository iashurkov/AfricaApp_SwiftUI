//
//  ExternalWeblinkView.swift
//  AfricaApp_SwiftUI
//
//  Created by Igor Ashurkov on 07.12.2022.
//

import SwiftUI

struct ExternalWeblinkView: View {
    
    // MARK: Properties
    
    let model: Animal
    
    // MARK: Body
    
    var body: some View {
        GroupBox {
            HStack {
                Image(systemName: "globe")
                
                Text("Wikipedia")
                
                Spacer()
                
                Group {
                    Image(systemName: "arrow.up.right.square")
                    
                    Link(self.model.name,
                         destination: URL(string: self.model.link) ?? URL(string: "https://wikipedia.org")!)
                } //: Group
                .foregroundColor(.accentColor)
            } //: HStack
        } //: GroupBox
    }
}

struct ExternalWeblinkView_Previews: PreviewProvider {
    
    private static let testData: [Animal] = Bundle.main.decode("animals.json")
    
    static var previews: some View {
        ExternalWeblinkView(model: self.testData[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}

//
//  ContentView.swift
//  AfricaApp_SwiftUI
//
//  Created by Igor Ashurkov on 27.11.2022.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: Properties
    
    let coverImages: [CoverImage] = Bundle.main.decode("covers.json")
    let animals: [Animal] = Bundle.main.decode("animals.json")
    
    // MARK: Body
    
    var body: some View {
        NavigationView {
            List {
                CoverImageView(model: self.coverImages)
                    .frame(height: 300)
                    .listRowInsets(EdgeInsets(top: 0,
                                              leading: 0,
                                              bottom: 0,
                                              trailing: 0))
                
                ForEach(self.animals) { animal in
                    NavigationLink(destination: AnimalDetailView(model: animal)) {
                        AnimalListItemView(model: animal)
                    } //: NavigationLink
                } //: ForEach
            } //: List
            .navigationTitle("Africa")
            .listStyle(.plain)
        } //: NavigationView
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

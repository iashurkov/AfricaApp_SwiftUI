//
//  ContentView.swift
//  AfricaApp_SwiftUI
//
//  Created by Igor Ashurkov on 27.11.2022.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: Properties
    
    private let coverImages: [CoverImage] = Bundle.main.decode("covers.json")
    private let animals: [Animal] = Bundle.main.decode("animals.json")
    
    private let haptics = UIImpactFeedbackGenerator(style: .medium)
    
    @State private var isGridViewActive = false
    @State private var gridLayout = [GridItem(.flexible())]
    @State private var gridColumn = 1
    @State private var toolBarIcon = "square.grid.2x2"
    
    // MARK: Private func
    
    private func gridSwitch() {
        self.gridLayout = Array(repeating: .init(.flexible()), count: self.gridLayout.count % 3 + 1)
        self.gridColumn = self.gridLayout.count
        
        switch self.gridColumn {
        case 1:
            self.toolBarIcon = "square.grid.2x2"
        case 2:
            self.toolBarIcon = "square.grid.3x2"
        default:
            self.toolBarIcon = "rectangle.grid.1x2"
        }
    }
    
    // MARK: Body
    
    var body: some View {
        NavigationView {
            Group {
                if self.isGridViewActive {
                    ScrollView(.vertical, showsIndicators: false) {
                        LazyVGrid(columns: self.gridLayout, alignment: .center, spacing: 10) {
                            ForEach(self.animals) { item in
                                NavigationLink(destination: AnimalDetailView(model: item)) {
                                    AnimalGridItemView(model: item)
                                } //: NavigationLink
                            } //: ForEach
                        } //: LazyVGrid
                        .padding(10)
                        .animation(.easeIn)
                    } //: ScrollView
                } else {
                    List {
                        CoverImageView(model: self.coverImages)
                            .frame(height: 300)
                            .listRowInsets(EdgeInsets(top: 0,
                                                      leading: 0,
                                                      bottom: 0,
                                                      trailing: 0))
                        
                        ForEach(self.animals) { item in
                            NavigationLink(destination: AnimalDetailView(model: item)) {
                                AnimalListItemView(model: item)
                            } //: NavigationLink
                        } //: ForEach
                        
                        CreditsView()
                            .modifier(CenterModifier())
                    } //: List
                }
            } //: Group
            .navigationTitle("Africa")
            .listStyle(.plain)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    HStack(spacing: 16) {
                        // - List view
                        Button(action: {
                            self.isGridViewActive = false
                            self.haptics.impactOccurred()
                        }) {
                            Image(systemName: "square.fill.text.grid.1x2")
                                .font(.title2)
                                .foregroundColor(self.isGridViewActive ? .primary : .accentColor)
                        } //: Button
                        
                        // - GRID
                        Button(action: {
                            self.isGridViewActive = true
                            self.haptics.impactOccurred()
                            
                            self.gridSwitch()
                        }) {
                            Image(systemName: self.toolBarIcon)
                                .font(.title2)
                                .foregroundColor(self.isGridViewActive ? .accentColor : .primary)
                        } //: Button
                    } //: HStack
                } //: ToolbarItem
            }
        } //: NavigationView
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

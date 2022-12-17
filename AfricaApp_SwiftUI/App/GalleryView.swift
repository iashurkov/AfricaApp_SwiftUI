//
//  GalleryView.swift
//  AfricaApp_SwiftUI
//
//  Created by Igor Ashurkov on 29.11.2022.
//

import SwiftUI

struct GalleryView: View {
    
    // MARK: Properties
    
    @State private var selectedAnimal = "lion"
    
    private let animals: [Animal] = Bundle.main.decode("animals.json")
    private let haptics = UIImpactFeedbackGenerator(style: .medium)
    
    // Simple Grid Definition
//    private let gridLayout = [
//        GridItem(.flexible()),
//        GridItem(.flexible()),
//        GridItem(.flexible())
//    ]
    
    // Efficient Grid Definition
//    private let gridLayout = Array(repeating: GridItem(.flexible()), count: 3)
    
    // Dynamic Grid Layout
    @State private var gridLayout = [GridItem(.flexible())]
    @State private var gridColumn: Double = 3.0
    
    // MARK: Private Methods
    
    private func gridSwitch() {
        self.gridLayout = Array(repeating: .init(.flexible()), count: Int(self.gridColumn))
    }
    
    // MARK: Body
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .center, spacing: 30) {
                // - IMAGE
                Image(self.selectedAnimal)
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 8))
                
                // - SLIDER
                Slider(value: $gridColumn, in: 2...4, step: 1)
                    .padding(.horizontal)
                    .onChange(of: self.gridColumn, perform: { value in
                        self.gridSwitch()
                    })
                
                // - GRID
                LazyVGrid(columns: self.gridLayout, alignment: .center, spacing: 10) {
                    ForEach(self.animals) { item in
                        Image(item.image)
                            .resizable()
                            .scaledToFit()
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.white, lineWidth: 1))
                            .onTapGesture {
                                self.selectedAnimal = item.image
                                self.haptics.impactOccurred()
                            }
                    } //: ForEach
                } //: LazyVGrid
                .animation(.easeIn)
                .onAppear(perform: {
                    self.gridSwitch()
                })
            } //: VStack
            .padding(.horizontal, 10)
            .padding(.vertical, 50)
        } //: ScrollView
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(MotionAnimationView())
    }
}

struct GalleryView_Previews: PreviewProvider {
    static var previews: some View {
        GalleryView()
    }
}

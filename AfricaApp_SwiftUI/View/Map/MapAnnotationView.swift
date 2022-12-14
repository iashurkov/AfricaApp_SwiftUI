//
//  MapAnnotationView.swift
//  AfricaApp_SwiftUI
//
//  Created by Igor Ashurkov on 14.12.2022.
//

import SwiftUI

struct MapAnnotationView: View {
    
    // MARK: Properties
    
    var model: NationalParkLocation
    @State private var animation: Double = 0.0
    
    // MARK: Body
    
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.accentColor)
                .frame(width: 54, height: 54, alignment: .center)
            
            Circle()
                .stroke(Color.accentColor, lineWidth: 2)
                .frame(width: 52, height: 52, alignment: .center)
                .scaleEffect(1 + CGFloat(self.animation))
                .opacity(1 - self.animation)
            
            Image(self.model.image)
                .resizable()
                .scaledToFit()
                .frame(width: 48, height: 48, alignment: .center)
            .clipShape(Circle())
        } //: ZStack
        .onAppear {
            withAnimation(Animation.easeOut(duration: 2).repeatForever(autoreverses: false)) {
                self.animation = 1
            }
        }
    }
}

struct MapAnnotationView_Previews: PreviewProvider {
    
    private static let testData: [NationalParkLocation] = Bundle.main.decode("locations.json")
    
    static var previews: some View {
        MapAnnotationView(model: self.testData[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}

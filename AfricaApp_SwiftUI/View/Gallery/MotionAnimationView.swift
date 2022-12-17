//
//  MotionAnimationView.swift
//  AfricaApp_SwiftUI
//
//  Created by Igor Ashurkov on 17.12.2022.
//

import SwiftUI

struct MotionAnimationView: View {
    
    // MARK: Properties
    
    @State private var randomCircle = Int.random(in: 12...16)
    @State private var isAnimating = false
    
    // MARK: Private methods
    
    // 1. Random Coordinate
    private func randomCoordinate(max: CGFloat) -> CGFloat {
        CGFloat.random(in: 0...max)
    }
    
    // 2. Random Size
    private func randomSize() -> CGFloat {
        CGFloat(Int.random(in: 10...300))
    }
    
    // 3. Random Scale
    private func randomScale() -> CGFloat {
        CGFloat(Double.random(in: 0.1...2.0))
    }
    
    // 4. Random Speed
    private func randomSpeed() -> Double {
        Double.random(in: 0.025...1.0)
    }
    
    // 5. Random Delay
    private func randomDelay() -> Double {
        Double.random(in: 0...2)
    }
    
    // MARK: Body
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                ForEach(0...self.randomCircle, id: \.self) { item in
                    let circleSize = self.randomSize()
                    
                    let animation = Animation.interpolatingSpring(stiffness: 0.5, damping: 0.5)
                                    .repeatForever()
                                    .speed(self.randomSpeed())
                                    .delay(self.randomDelay())
                    
                    Circle()
                        .foregroundColor(.gray)
                        .opacity(0.15)
                        .frame(width: circleSize,
                               height: circleSize,
                               alignment: .center)
                        .scaleEffect(self.isAnimating ? self.randomScale() : 1)
                        .position(
                            x: self.randomCoordinate(max: geometry.size.width),
                            y: self.randomCoordinate(max: geometry.size.height)
                        )
                        .onAppear {
                            withAnimation(animation) {
                                self.isAnimating = true
                            }
                        }
                } //: ForEach
            } //: ZStack
            .drawingGroup()
        } //: GeometryReader
    }
}

struct MotionAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        MotionAnimationView()
    }
}

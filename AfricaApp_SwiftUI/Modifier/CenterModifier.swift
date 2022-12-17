//
//  CenterModifier.swift
//  AfricaApp_SwiftUI
//
//  Created by Igor Ashurkov on 17.12.2022.
//

import SwiftUI

struct CenterModifier: ViewModifier {
    func body(content: Content) -> some View {
        HStack {
            Spacer()
            content
            Spacer()
        } //: HStack
    }
}

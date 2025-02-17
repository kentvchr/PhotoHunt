//
//  CapsuleButtonStyle.swift
//  PhotoHunt
//
//  Created by Quentin Verchère on 05/11/2024.
//

import SwiftUI

struct CapsuleButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(.white)
            .padding(12)
            .background(Color.blue)
            .clipShape(Circle())
            .foregroundColor(.blue)
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
            .animation(.spring(), value: configuration.isPressed)
    }
}

extension Button {
    func capsuleButtonStyle() -> some View {
        buttonStyle(CapsuleButtonStyle())
    }
}

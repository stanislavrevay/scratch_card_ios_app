//
//  Card.swift
//  ScratchCardAssignment
//
//  Created by Stanislav Révay on 05/11/2025.
//

import SwiftUI

enum CardState: String {
    case unscratched = "New"
    case scratched = "Scratched"
    case activated = "Activated"
}

struct Card {
    var code: String?
    var state: CardState = .unscratched
    var title: String { self.state.rawValue }

    @ViewBuilder var style: some View {
        let gradient = LinearGradient(
            gradient: Gradient(colors: [.purple, .blue]),
            startPoint: .topLeading,
            endPoint: .bottomTrailing)
        
        switch self.state {
            case .unscratched:
                gradient.overlay(.black.opacity(0.7))
            case .scratched:
                gradient.overlay(.black.opacity(0.45))
            case .activated:
                gradient.overlay(.black.opacity(0.0))
        }
    }
}

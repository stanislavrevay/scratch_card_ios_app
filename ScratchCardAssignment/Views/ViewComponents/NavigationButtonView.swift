//
//  NavigationButtonView.swift
//  ScratchCardAssignment
//
//  Created by Stanislav Révay on 05/11/2025.
//

import SwiftUI

struct NavigationButtonView: View {
    var text: String
    var action: () -> Void
    var disabled: Bool
    
    init(text: String, disabled: Bool, _ action: @escaping () -> Void) {
        self.text = text
        self.action = action
        self.disabled = disabled
    }
    
    var body: some View {
        Button(action: action) {
            HStack(spacing: 8) {
                Text(text)
                    .bold()
                Image(systemName: "arrow.forward")
                    .bold()
            }
                .padding()
                .foregroundStyle(Color.white)
                .frame(width: 320)
                .background(disabled ? Color.gray : Color.blue)
                .clipShape(Capsule())
        }
        .disabled(disabled)
    }
}

#Preview {
    NavigationButtonView(text: "Navigation Button", disabled: false) {
        print("Navigation Button action")
    }
}

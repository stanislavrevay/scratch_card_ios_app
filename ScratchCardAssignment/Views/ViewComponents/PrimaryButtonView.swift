//
//  PrimaryButtonView.swift
//  ScratchCardAssignment
//
//  Created by Stanislav Révay on 05/11/2025.
//

import SwiftUI

struct PrimaryButtonView: View {
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
            Text(text)
                .bold()
                .padding()
                .foregroundStyle(Color.white)
                .frame(width: 200)
                .background(disabled ? Color.gray : Color.blue)
                .clipShape(Capsule())
        }
        .disabled(disabled)
    }
}

#Preview {
    PrimaryButtonView(text: "Primary Button", disabled: false) {
        print("Primary button action")
    }
}

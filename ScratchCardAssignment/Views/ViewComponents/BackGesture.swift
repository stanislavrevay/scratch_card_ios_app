//
//  BackGesture.swift
//  ScratchCardAssignment
//
//  Created by Stanislav Révay on 05/11/2025.
//

import SwiftUI

extension View {
    func navigateBackGesture(_ action: @escaping () -> Void) -> some View {
        self.gesture(
            DragGesture()
                .onEnded { value in
                    if abs(value.translation.width) > abs(value.translation.height),
                       value.translation.width > 60 {
                        action()
                    }
                }
        )
    }
    
}

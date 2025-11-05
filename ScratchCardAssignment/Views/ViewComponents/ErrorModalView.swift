//
//  ErrorModalView.swift
//  ScratchCardAssignment
//
//  Created by Stanislav Révay on 05/11/2025.
//

import SwiftUI

extension View {
    @ViewBuilder
    func errorModalOverlay(_ message: String?, _ dismiss: @escaping () -> Void) -> some View {
        self.overlay {
            if let err = message {
                VStack {
                    Spacer()
                    Text(err)
                        .bold()
                        .foregroundStyle(.white)
                        .padding()
                        .frame(width: 320, height: 48)
                        .background(Color.red)
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                        .onAppear() {
                            Task {
                                try? await Task.sleep(for: .seconds(3))
                                dismiss()
                            }
                        }
                }
                .padding(.bottom, 64)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.black.opacity(0.8).ignoresSafeArea())
            }
        }
        .animation(.bouncy, value: message)
    }
}

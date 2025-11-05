//
//  ScratchView.swift
//  ScratchCardAssignment
//
//  Created by Stanislav Révay on 05/11/2025.
//

import SwiftUI

struct ScratchViewNavigation: Hashable {}

struct ScratchView: View {
    @EnvironmentObject var viewModel: ScratchViewModel
    @EnvironmentObject var navigation: Navigation
    
    var body: some View {
        BaseView(title: "Scratch", dismiss: {
            viewModel.cancelScratching()
            navigation.navigateBack()
        }) {
            CardView(card: viewModel.card)
                .overlay {
                    if viewModel.loadingChange {
                        ProgressView()
                            .tint(Color.white)
                    }
                }
            Spacer()
            
            PrimaryButtonView(
                text: "Scratch Card",
                disabled: viewModel.card.state != .unscratched || viewModel.loadingChange) {
                viewModel.scratchCard()
            }
        }
        .navigationBarBackButtonHidden()
        .navigateBackGesture {
            viewModel.cancelScratching()
            navigation.navigateBack()
        }
    }
}

#Preview {
    ScratchView()
}

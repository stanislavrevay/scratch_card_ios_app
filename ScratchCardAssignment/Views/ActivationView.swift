//
//  ActivationView.swift
//  ScratchCardAssignment
//
//  Created by Stanislav Révay on 05/11/2025.
//

import SwiftUI

struct ActivationViewNavigation: Hashable {}

struct ActivationView: View {
    @EnvironmentObject var viewModel: ScratchViewModel
    @EnvironmentObject var navigation: Navigation
    
    var body: some View {
        BaseView(title: "Activate", dismiss: {
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
                text: "Activate Card",
                disabled: viewModel.card.state != .scratched || viewModel.loadingChange) {
                viewModel.activateCard()
            }
        }
        .navigationBarBackButtonHidden()
        .navigateBackGesture { navigation.navigateBack() }
    }
}

#Preview {
    ActivationView()
}

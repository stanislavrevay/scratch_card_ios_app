//
//  MainView.swift
//  ScratchCardAssignment
//
//  Created by Stanislav Révay on 05/11/2025.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var viewModel: ScratchViewModel
    @EnvironmentObject var navigation: Navigation
    
    var body: some View {
        BaseView(title: "Main") {
            CardView(card: viewModel.card)
            Spacer()
            
            NavigationButtonView(
                text: "Scratch",
                disabled: viewModel.card.state != .unscratched) {
                    navigation.navigateTo(ScratchViewNavigation())
            }
            
            NavigationButtonView(
                text: "Activate",
                disabled: viewModel.card.state != .scratched) {
                    navigation.navigateTo(ActivationViewNavigation())
            }
            
            Button(action: {
                viewModel.reset()
            }) { Text("Reset") }
        }
    }
}

#Preview {
    MainView()
}

//
//  ContentView.swift
//  ScratchCardAssignment
//
//  Created by Stanislav Révay on 05/11/2025.
//

import SwiftUI
import Combine

struct ContentView: View {
    @EnvironmentObject var viewModel: ScratchViewModel
    @EnvironmentObject var navigation: Navigation
    
    var body: some View {
        NavigationStack(path: $navigation.path) {
            MainView()
                .navigationDestination(for: ScratchViewNavigation.self) { _ in ScratchView() }
                .navigationDestination(for: ActivationViewNavigation.self) { _ in ActivationView() }
        }
        .errorModalOverlay(viewModel.errorMessage, viewModel.confirmError)
    }
}

#Preview {
    ContentView()
}

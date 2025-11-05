//
//  ScratchCardAssignmentApp.swift
//  ScratchCardAssignment
//
//  Created by Stanislav Révay on 05/11/2025.
//

import SwiftUI

@main
struct ScratchCardAssignmentApp: App {
    @StateObject var viewModel = ScratchViewModel(ScratchServices())
    @StateObject var navigation = Navigation()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
                .environmentObject(navigation)
        }
    }
}

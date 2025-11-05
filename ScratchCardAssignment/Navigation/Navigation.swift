//
//  Navigation.swift
//  ScratchCardAssignment
//
//  Created by Stanislav Révay on 05/11/2025.
//

import SwiftUI
import Combine

class Navigation: ObservableObject {
    @Published var path = NavigationPath()
    @Published private(set) var modalMessage: String = ""
    @Published private(set) var showModal: Bool = false
    
    func navigateTo<V>(_ destination: V) where V: Hashable {
        path.append(destination)
    }
    
    func navigateBack() {
        path.removeLast()
    }
}

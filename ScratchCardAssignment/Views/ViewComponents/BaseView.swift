//
//  BaseView.swift
//  ScratchCardAssignment
//
//  Created by Stanislav Révay on 05/11/2025.
//

import SwiftUI

struct BaseView<Content: View>: View {
    let title: String
    let dismiss: (() -> Void)?
    let content: Content
    
    init(title: String, dismiss: (() -> Void)? = nil, @ViewBuilder _ content: () -> Content) {
        self.title = title
        self.dismiss = dismiss
        self.content = content()
    }
    
    var body: some View {
        VStack(spacing: 0) {
            HeaderView(title: title, dismiss: dismiss)
            Divider()
            
            VStack(spacing: 24) {
                content
            }
            .padding(24)
        }
        .background(Color.gray.opacity(0.1).ignoresSafeArea())
    }
}

#Preview {
    BaseView(title: "Base View") {
        Text("Welcome to the base view!")
    }
}

//
//  HeaderView.swift
//  ScratchCardAssignment
//
//  Created by Stanislav Révay on 05/11/2025.
//

import SwiftUI

struct HeaderView: View {
    let title: String
    let dismiss: (() -> Void)?
    
    init(title: String, dismiss: (() -> Void)? = nil) {
        self.title = title
        self.dismiss = dismiss
    }
    
    var body: some View {
        HStack {
            if let dismiss = dismiss {
                Button(action: dismiss) {
                    Image(systemName: "chevron.left")
                        .padding(.leading, 24)
                        .frame(width: 32)
                }
            }
            Spacer()
            Text(title)
                .font(.title)
                .padding()
                .padding(.trailing, dismiss != nil ? 56 : 0)
            Spacer()
        }
    }
}

#Preview {
    HeaderView(title: "Header View", dismiss: { print("Dismissed!") })
}

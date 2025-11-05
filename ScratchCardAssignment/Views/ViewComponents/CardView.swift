//
//  CardView.swift
//  ScratchCardAssignment
//
//  Created by Stanislav Révay on 05/11/2025.
//

import SwiftUI

struct CardView: View {
    let card: Card
    
    var body: some View {
        VStack {
            HStack {
                if card.state == .activated {
                    Image(systemName: "checkmark.seal")
                        .foregroundStyle(.white)
                        .font(.headline)
                        .padding(4)
                        .background(Color.green)
                        .clipShape(Circle())
                }
                
                Spacer()
                Text(card.title)
                    .foregroundStyle(.white)
                    .padding(.horizontal)
                    .padding(.vertical, 4)
                    .background(Color.green)
                    .clipShape(Capsule())
            }
            Spacer()
            
            if let code = card.code {
                Text(code)
                    .font(.caption)
                    .foregroundStyle(.black)
                    .padding(4)
                    .frame(maxWidth: .infinity)
                    .background(.white)
            }
        }
        .animation(.bouncy, value: card.state)
        .padding(16)
        .frame(width: 320, height: 200)
        .background(card.style)
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}

#Preview {
    CardView(card: Card(code: nil, state: .unscratched))
    CardView(card: Card(code: "1234", state: .scratched))
    CardView(card: Card(code: "123456", state: .activated))
}

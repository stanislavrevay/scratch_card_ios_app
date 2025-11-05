//
//  ScratchViewModel.swift
//  ScratchCardAssignment
//
//  Created by Stanislav Révay on 05/11/2025.
//

import SwiftUI
import Combine

class ScratchViewModel: ObservableObject {
    private var service: ScratchServicesProtocol
    @Published private(set) var card = Card()
    @Published private(set) var loadingChange: Bool = false
    @Published private(set) var errorMessage: String? = nil
    private var scratchCancellable: AnyCancellable?
    
    init(_ service: ScratchServicesProtocol) {
        self.service = service
    }
    
    private func startCardScratching() -> Future<Bool, Never> {
        return Future { promise in
            Task {
                // Heavy operation simulation
                try? await Task.sleep(for: .seconds(2))
                promise(.success((true)))
            }
        }
    }
    
    func scratchCard() {
        cancelScratching()
        loadingChange = true
        scratchCancellable = startCardScratching().sink { _ in
            self.card.state = .scratched
            self.card.code = UUID().uuidString
            self.loadingChange = false
        }
    }
    
    func cancelScratching() {
        loadingChange = false
        scratchCancellable?.cancel()
    }
    
    func activateCard() {
        Task {
            loadingChange = true
            do {
                let result = try await service.activateCard()
                card.state = result ? .activated : card.state
            } catch {
                self.errorMessage = error.localizedDescription
            }
            loadingChange = false
        }
    }
    
    func reset() { card = Card() }
    
    func confirmError() { errorMessage = nil }
}

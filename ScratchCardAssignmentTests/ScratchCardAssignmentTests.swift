//
//  ScratchCardAssignmentTests.swift
//  ScratchCardAssignmentTests
//
//  Created by Stanislav Révay on 05/11/2025.
//

import XCTest
@testable import ScratchCardAssignment

class MockService: ScratchServicesProtocol {
    func activateCard() async throws -> Bool {
        return true
    }
}

final class ScratchCardAssignmentTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    @MainActor
    func testInitialCardState() async throws {
        let viewModel = ScratchViewModel(MockService())
        XCTAssertTrue(viewModel.card.state == .unscratched)
        XCTAssertTrue(viewModel.card.code == nil)
    }
    
    @MainActor
    func testScratchCard() async throws {
        let viewModel = ScratchViewModel(MockService())
        
        viewModel.scratchCard()
        try? await Task.sleep(for: .seconds(2.1))
        
        XCTAssertTrue(viewModel.card.state == .scratched)
        XCTAssertTrue(viewModel.card.code != nil)
    }
    
    @MainActor
    func testScratchCardCancellation() async throws {
        let viewModel = ScratchViewModel(MockService())
        
        viewModel.scratchCard()
        viewModel.cancelScratching()
        
        XCTAssertTrue(viewModel.card.state == .unscratched)
        XCTAssertTrue(viewModel.card.code == nil)
    }
    
    @MainActor
    func testCardActivation() async throws {
        let viewModel = ScratchViewModel(MockService())
        
        viewModel.activateCard()
        try? await Task.sleep(for: .seconds(1))
        XCTAssertTrue(viewModel.card.state == .activated)
    }
}

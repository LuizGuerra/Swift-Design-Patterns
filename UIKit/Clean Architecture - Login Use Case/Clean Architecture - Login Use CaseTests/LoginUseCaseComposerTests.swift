//
//  LoginUseCaseComposerTests.swift
//  Clean Architecture - Login Use CaseTests
//
//  Created by Luiz Pedro Franciscatto Guerra on 03/03/23.
//

import XCTest
@testable import Clean_Architecture___Login_Use_Case

final class LoginUseCaseComposerTests: XCTestCase {


    func test_composingZeroOutputs_doesNotCrash() {
        let composer = LoginUseCaseComposer(outputs: [])
        composer.success()
        composer.failure(NSError(domain: "", code: 1))
    }
    
    func test_composingOutputs_delegatesSuccessMessage() {
        let spy1 = LoginUseCaseOutputSpy()
        let spy2 = LoginUseCaseOutputSpy()
        let outputs = [spy1, spy2]
        let composer = LoginUseCaseComposer(outputs: outputs)
        
        composer.success()
        
        XCTAssertEqual(spy1.successCount, 1)
        XCTAssertEqual(spy1.failureCount, 0)
        
        XCTAssertEqual(spy2.successCount, 1)
        XCTAssertEqual(spy2.failureCount, 0)
    }
    
    func test_composingOutputs_delegatesFailureMessage() {
        let spy1 = LoginUseCaseOutputSpy()
        let spy2 = LoginUseCaseOutputSpy()
        let outputs = [spy1, spy2]
        let composer = LoginUseCaseComposer(outputs: outputs)
        
        composer.failure(NSError(domain: "", code: 1))
        
        XCTAssertEqual(spy1.successCount, 0)
        XCTAssertEqual(spy1.failureCount, 1)
        
        XCTAssertEqual(spy2.successCount, 0)
        XCTAssertEqual(spy2.failureCount, 1)
    }
    
    // MARK: Helpers
    
    private class LoginUseCaseOutputSpy: LoginUseCaseOutputDelegate {
        
        var successCount = 0
        var failureCount = 0
        
        func success() {
            successCount += 1
        }
        
        func failure(_ error: Error) {
            failureCount += 1
        }
    }

}

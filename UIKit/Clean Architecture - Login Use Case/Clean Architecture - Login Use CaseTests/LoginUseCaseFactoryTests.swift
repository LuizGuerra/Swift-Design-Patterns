//
//  LoginUseCaseFactoryTests.swift
//  Clean Architecture - Login Use CaseTests
//
//  Created by Luiz Pedro Franciscatto Guerra on 03/03/23.
//

import XCTest
@testable import Clean_Architecture___Login_Use_Case

final class LoginUseCaseFactoryTests: XCTestCase {

    func test_createdUseCase_hasComposedOutputs() {
        let factory = LoginUseCaseFactory()
        let useCase = factory.makeUseCase()
        let composer = useCase.analytics as? LoginUseCaseComposer
        
        XCTAssertNotNil(composer)
        
        XCTAssertEqual(composer?.outputs.count, 3)
        
        XCTAssertEqual(composer?.count(ofType: LoginPresenter.self), 1)
        XCTAssertEqual(composer?.count(ofType: FirebaseAnalyticsLoginTracker.self), 1)
        XCTAssertEqual(composer?.count(ofType: CrashlyticsLoginTracker.self), 1)
    }

}

private extension LoginUseCaseComposer {
    func count<T>(ofType: T.Type) -> Int {
        outputs.filter{ $0 is T}.count
    }
}

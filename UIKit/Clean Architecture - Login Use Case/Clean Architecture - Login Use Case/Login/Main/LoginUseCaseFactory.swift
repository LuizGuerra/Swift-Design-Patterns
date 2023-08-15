//
//  LoginUseCaseFactory.swift
//  Clean Architecture - Login Use Case
//
//  Created by Luiz Pedro Franciscatto Guerra on 03/03/23.
//

import Foundation

final class LoginUseCaseFactory {
    
    func makeUseCase() -> LoginUseCase {
        let composer = LoginUseCaseComposer(outputs: [
//            LoginPresenter(),
            FirebaseAnalyticsLoginTracker(),
            CrashlyticsLoginTracker(),
        ])
        return LoginUseCase(from: composer)
    }
    
}

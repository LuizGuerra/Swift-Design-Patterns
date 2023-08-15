//
//  LoginUseCaseComposer.swift
//  Clean Architecture - Login Use Case
//
//  Created by Luiz Pedro Franciscatto Guerra on 03/03/23.
//

import Foundation

final class LoginUseCaseComposer {
    
    private(set) var outputs: [LoginUseCaseOutputDelegate]
    
    init(outputs: [LoginUseCaseOutputDelegate]) {
        self.outputs = outputs
    }
    
}

// MARK: LoginCase Output Delegate Implementation
extension LoginUseCaseComposer: LoginUseCaseOutputDelegate {
    func success() {
        outputs.forEach { $0.success() }
    }
    func failure(_ error: Error) {
        outputs.forEach { $0.failure(error) }
    }
}

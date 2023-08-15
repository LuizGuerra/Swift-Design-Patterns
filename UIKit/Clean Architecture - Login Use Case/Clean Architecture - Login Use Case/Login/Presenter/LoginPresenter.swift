//
//  LoginPresenter.swift
//  Clean Architecture - Login Use Case
//
//  Created by Luiz Pedro Franciscatto Guerra on 03/03/23.
//

import Foundation

final class LoginPresenter {
    
    weak var fatherDelegate: LoginPresenterDelegate?
    
    let loginUseCase: LoginUseCase
    
    init() {
        loginUseCase = LoginUseCaseFactory().makeUseCase()
    }
    
    // Tries to make login
    // and parse the server response to show at the view
    func login(_ email: String, _ password: String) {
        loginUseCase.login(name: email, password: password) { [weak self] error in
            
            // Make sure the class reference still exists, if not, exit
            guard let self else { return }
            
            // Search for an error
            guard let error else {
                
                // If no errors found (successful login)
                self.fatherDelegate?.display("Luiz Guerra")
                return
            }
            
            if error == .Input_BadEmail || error == .Input_BadEmailAndPassword {
                
                // if inputed email was wrong
                self.fatherDelegate?.incorrectLogin()
                
            } else  if error == .Input_BadPassword || error == .Input_BadEmailAndPassword {
                
                // if inputed password was wrong
                self.fatherDelegate?.incorrectPassword()
                
            } else {
                
                // if there was a problem with the login
                self.fatherDelegate?.display(.init(error: error))
                
            }
            
        }

    }
    
}

// MARK: Delegate implementation
// The father class implements this delegate to
// have a generic parent and reduce class coupling
protocol LoginPresenterDelegate: AnyObject {
    func display(_ welcomeMessage: String)
    func display(_ errorMessage: ErrorMessage)
    func incorrectLogin()
    func incorrectPassword()
}


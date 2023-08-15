//
//  LoginUseCase.swift
//  Clean Architecture - Login Use Case
//
//  Created by Luiz Pedro Franciscatto Guerra on 03/03/23.
//

import Foundation

// The protocol conforms to AnyObject to allow a View-Presenter communication
// Using the delegate design pattern
protocol LoginUseCaseOutputDelegate: AnyObject {
    func success()
    func failure(_ error: Error)
}

final class LoginUseCase {
    
    private(set) var analytics: LoginUseCaseComposer
    
    init(from analytics: LoginUseCaseComposer) {
        self.analytics = analytics
    }
    
    func login(name: String, password: String,
               _ completion: (APILoginError?) -> Void) {
        // fake api call to login here
        let loginSuccessfulErrorCode = Int.random(in: 0..<14)
        
        guard let error = APILoginError(rawValue: loginSuccessfulErrorCode)
        else {
            
            // if everything ok
            // tell all analytics classes to log the success
            analytics.success()
            // then update the view
            completion(nil)
            return
            
        }
        
        // if there was an error
        // tell all analytics classes to log what happened
        analytics.failure(error)
        // then update the view
        completion(error)
            
    }
}

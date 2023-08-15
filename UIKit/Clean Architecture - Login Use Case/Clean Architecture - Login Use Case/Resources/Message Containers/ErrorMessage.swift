//
//  ErrorMessage.swift
//  Clean Architecture - Login Use Case
//
//  Created by Luiz Pedro Franciscatto Guerra on 06/03/23.
//

import Foundation

final class ErrorMessage {
    let title: String
    let description: String
    let error: Error
    init(error: Error) {
        
        // saves the error
        self.error = error
        
        if let error = error as? APILoginError {
            self.title = error.asTitle
            self.description = error.asDescription
            return
        }
        
        // if nothing else matches, save the default data
        self.title = "Something went wrong."
        self.description = "\(error)"
    }
}

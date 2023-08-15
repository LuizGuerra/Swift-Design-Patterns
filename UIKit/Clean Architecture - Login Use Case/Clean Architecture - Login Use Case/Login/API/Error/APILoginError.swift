//
//  APILoginError.swift
//  Clean Architecture - Login Use Case
//
//  Created by Luiz Pedro Franciscatto Guerra on 06/03/23.
//

import Foundation

// This is a bundle of different errors
// you might want to do this differently with your app
enum APILoginError: Int, Error {
    // Internet errors
    case Internet_NoConnection
    case Internet_BadConnection
    // Bad Input Data
    case Input_BadEmail
    case Input_BadPassword
    case Input_BadEmailAndPassword
    // Server errors
    case Server_NotFound
    case Server_Maintenance
    case Server_FullCapacity
    case Server_MessageTimeOut
    // If nothing conforms, give default error
    case DefaultError
    
    // The switchs here should probably get the data from a language file
    var asTitle: String {
        switch self {
        case .Internet_NoConnection, .Internet_BadConnection:
            return "Internet problem"
        case .Input_BadEmail, .Input_BadPassword, .Input_BadEmailAndPassword:
            return "Bad Input"
        case .Server_NotFound, .Server_Maintenance, .Server_FullCapacity, .Server_MessageTimeOut:
            return "Server problem"
        case .DefaultError:
            return "Something went wrong. The error was already reported and we are looking at it right now."
        }
    }
    
    // The switchs here should probably get the data from a language file
    var asDescription: String {
        switch self {
        case .Internet_NoConnection:
            return "No Internet Connection"
        case .Internet_BadConnection:
            return "Internet Connection too Slow"
        case .Input_BadEmail:
            return "Email was incorrect"
        case .Input_BadPassword:
            return "Password was incorrect"
        case .Input_BadEmailAndPassword:
            return "Email and Password were incorrect"
        case .Server_NotFound:
            return "Server not Found"
        case .Server_Maintenance:
            return "Server is under maintenence"
        case .Server_FullCapacity:
            return "Server is at full capacity. Please, wait a little bit while we scale it."
        case .Server_MessageTimeOut:
            return "Couldn't get the answer in time, please try again later."
        case .DefaultError:
            return "Something went wrong. The error was already reported and we are looking at it right now."
        }
    }
}

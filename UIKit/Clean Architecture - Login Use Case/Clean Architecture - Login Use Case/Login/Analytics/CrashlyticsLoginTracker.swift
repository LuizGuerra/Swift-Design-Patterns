//
//  CrashlyticsLoginTracker.swift
//  Clean Architecture - Login Use Case
//
//  Created by Luiz Pedro Franciscatto Guerra on 03/03/23.
//

import Foundation

// import Crashlytics
// fake class for demonstration purposes
class Crashlytics {
    func log(_ log: String) {
        print(log)
    }
}

final class CrashlyticsLoginTracker: LoginUseCaseOutputDelegate {
    let crashlytics = Crashlytics()
    
    func success() {
        crashlytics.log("Crashlytics: Login Success")
    }
    
    func failure(_ error: Error) {
        crashlytics.log("Crashlytics: Login Failure: \(error)")
    }
}
